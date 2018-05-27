# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  describe '.new' do
    it 'does not allow two categories with the same name' do
      Category.create(name: 'Something Relevant')
      expect(Category.new(name: 'Something Relevant')).not_to be_valid
    end
  end
end
