# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  category_id :integer
#  description :text
#  done        :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :category
  validates :description, presence: true
end
