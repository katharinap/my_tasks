# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  date              :date
#  duration_in_hours :decimal(, )
#

class Task < ApplicationRecord
  belongs_to :category
  validates :description, presence: true
  validates :date, presence: true
  validates :duration_in_hours, presence: true

  scope :for_date, ->(date) { where('date = ?', date) }
  # rubocop:disable Metrics/LineLength
  scope :for_date_range, ->(first, last) { where('date >= ? AND date <= ?', first, last) }
  # rubocop:enable Metrics/LineLength

  class << self
    def relative_day_pensum(tasks)
      (duration_in_days(tasks) * 100).round
    end

    def duration_in_days(tasks)
      tasks.map(&:duration_in_hours).reduce(0, :+) / 8.0
    end
  end
end
