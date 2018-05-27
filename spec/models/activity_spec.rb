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

require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe '.new' do
    let(:category) { Category.create(name: 'Something') }
    let(:task) { category.tasks.create(description: 'a step') }

    it 'does not allow to create an activity without a date our hours' do
      expect(task.activities.new(date: Date.today)).not_to be_valid
      expect(task.activities.new(hours: 1.5)).not_to be_valid
      expect(task.activities.new(date: Date.today, hours: 1.5)).to be_valid
    end
  end
end
