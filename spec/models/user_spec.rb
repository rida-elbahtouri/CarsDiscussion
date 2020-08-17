require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(fullname: 'test_name', username: 'test_username')
  end

  describe 'validations fullname' do
    it { should validate_presence_of(:fullname) }
    it { should validate_length_of(:fullname).is_at_most(30) }
    it { should validate_length_of(:fullname).is_at_least(3) }
    it 'is valid when fullname is not blank' do
      subject.fullname = 'Joe'
      expect(subject).to be_valid
    end

    it 'is invalid when fullname is blank' do
      subject.fullname = nil
      expect(subject).to_not be_valid
    end

    it 'is valid when fullname length is less than 30 and more than 3' do
      subject.fullname = 'Trevor'
      expect(subject).to be_valid
    end

    it 'is invalid when fullname length is greater than 20' do
      subject.fullname = 'A' * 31
      expect(subject).to_not be_valid
    end
  end
  describe 'Validate username' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_most(20) }
    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_uniqueness_of(:username) }

    it 'is valid when username is not blank' do
      subject.username = 'Joe'
      expect(subject).to be_valid
    end

    it 'is invalid when username is blank' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'is valid when username length is less than 20 and more than 3' do
      subject.username = 'Trevor'
      expect(subject).to be_valid
    end

    it 'is invalid when username length is greater than 20' do
      subject.username = 'A' * 21
      expect(subject).to_not be_valid
    end
  end
  describe 'Associations' do
    it { should have_many(:thoughts).with_foreign_key('author_id') }
    it { should have_many(:followers_group).class_name('Following').with_foreign_key('follower_id') }
    it { should have_many(:followers).through('followeds_group').with_foreign_key('followed_id') }
    it { should have_many(:followeds).through('followers_group').with_foreign_key('follower_id') }
  end
end
