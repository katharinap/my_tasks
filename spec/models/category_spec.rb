# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category do
  describe '.new' do
    it 'does not allow two categories with the same name' do
      Category.create(name: 'Something Relevant')
      expect(Category.new(name: 'Something Relevant')).not_to be_valid
    end

    it 'does not allow two categories without a name' do
      expect(Category.new).not_to be_valid
      expect(Category.new(name: 'Something Cool')).to be_valid
    end
  end
end
