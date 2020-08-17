require 'rails_helper'

RSpec.describe Thought, type: :model do
  let(:user) do
    User.create(fullname: 'test_name', username: 'test_username')
  end
  subject do
    Thought.new(author_id: user.id, text: 'Lorem Lorem Lorem Lorem Lorem Lorem')
  end

  describe 'validations text' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(1000) }
    it { should validate_length_of(:text).is_at_least(5) }
    it 'is valid when text is not blank' do
      subject.text = 'hello everyone'
      expect(subject).to be_valid
    end

    it 'is invalid when text is blank' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'is valid when text length is less than 1000 and more than 5' do
      subject.text = 'hello everyone ,my name is rida'
      expect(subject).to be_valid
    end

    it 'is invalid when text length is greater than 1000' do
      subject.text = 'A' * 1001
      expect(subject).to_not be_valid
    end
  end
  describe 'Associations' do
    it { should belong_to(:author).class_name('User') }
  end
end
