require 'spec_helper'

describe Interest do
  describe "interest validation" do
    let(:interest) { FactoryGirl.build(:interest)}
    before do
      interest.user = FactoryGirl.create :user
      item = FactoryGirl.build :item
      item.owner = FactoryGirl.create :user
      item.save
      interest.item = item
    end
    it "validates user presence" do
      interest.valid?.should be_true

      interest.user = nil
      interest.valid?.should be_false
    end
    it "validates user uniqueness" do
      interest.save.should be_true
      duplicate_interest = interest.item.interests.build(:user_id => interest.user_id)
      duplicate_interest.should_not be_valid
    end
    it "validates item presence" do
      interest.valid?.should be_true

      interest.item = nil
      interest.valid?.should be_false
    end
    it "validates status" do
      interest.valid?.should be_true

      interest.status = 10
      interest.valid?.should be_false
    end
  end
end
