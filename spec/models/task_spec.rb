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

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '.new' do
    let(:category) { Category.create(name: 'Something') }

    it 'does not allow to create a task without a description, date or duration' do
      expect(Task.new(category_id: category.id, duration_in_hours: 1.0, date: Date.today)).not_to be_valid
      expect(Task.new(category_id: category.id, duration_in_hours: 1.0, description: 'step two')).not_to be_valid
      expect(Task.new(category_id: category.id, date: Date.today, description: 'step two')).not_to be_valid
      expect(Task.new(category_id: category.id, duration_in_hours: 1.0, date: Date.today, description: 'step two')).to be_valid
    end
  end

  context 'date methods' do
    let(:category) { Category.create(name: 'Something') }

    def create_tasks
      %w[one two three].each { |desc| category.tasks.create(description: "task #{desc}", duration_in_hours: 1.0, date: Date.new(2018, 6, 27)) }
      %w[one].each { |desc| category.tasks.create(description: "task #{desc}", duration_in_hours: 1.0, date: Date.new(2018, 6, 28)) }
      %w[one].each { |desc| category.tasks.create(description: "task #{desc}", duration_in_hours: 1.0, date: Date.new(2018, 6, 29)) }
    end

    before :each do
      create_tasks
    end

    describe '.for_date' do
      it 'returns the tasks assigned to the given date' do
        expect(Task.for_date(Date.new(2018, 6, 27)).size).to eq(3)
      end
    end

    describe '.for_date_range' do
      it 'returns the tasks assigned to the given date range' do
        expect(Task.for_date_range(Date.new(2018, 6, 27), Date.new(2018, 6, 28)).size).to eq(4)
      end
    end
  end
end
