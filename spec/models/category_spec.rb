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

require 'rails_helper'

RSpec.describe Category do
  let(:user) { User.create(email: 'me@example.com', password: 'abc123!') }

  describe '.new' do
    it 'does not allow two categories without a name' do
      expect(Category.new(user_id: user.id)).not_to be_valid
      expect(Category.new(name: 'Something Cool', user_id: user.id)).to be_valid
    end
  end
end
