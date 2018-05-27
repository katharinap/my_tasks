# frozen_string_literal: true

# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  date       :date
#  hours      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Activity < ApplicationRecord
  belongs_to :task
  validates :date, presence: true
  validates :hours, presence: true
end
