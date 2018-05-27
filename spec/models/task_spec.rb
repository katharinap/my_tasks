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

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '.new' do
    let(:category) { Category.create(name: 'Something') }

    it 'creates new tasks as not-done' do
      task = category.tasks.create(description: 'step one')
      expect(task).not_to be_done
    end

    it 'does not allow to create a task without a description' do
      expect(Task.new(category_id: category.id)).not_to be_valid
      expect(Task.new(category_id: category.id, description: 'step two')).to be_valid
    end
  end
end
