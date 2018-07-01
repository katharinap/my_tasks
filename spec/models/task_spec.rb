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

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '.new' do
    let(:category) { Category.create(name: 'Something') }

    it 'does not allow to create a task without a description or date' do
      expect(Task.new(category_id: category.id, date: Date.today)).not_to be_valid
      expect(Task.new(category_id: category.id, description: 'step two')).not_to be_valid
      expect(Task.new(category_id: category.id, date: Date.today, description: 'step two')).to be_valid
    end
  end
end
