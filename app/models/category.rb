# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
