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
#  icon       :string           default("smile")
#  icon_color :integer          default("primary")
#

class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true

  enum icon_color: { primary: 0,
                     secondary: 1,
                     success: 2,
                     danger: 3,
                     warning: 4,
                     info: 5 }
end
