# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  category_id :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date        :date
#

class Task < ApplicationRecord
  belongs_to :category
  has_many :activities
  validates :description, presence: true
  validates :date, presence: true
end
