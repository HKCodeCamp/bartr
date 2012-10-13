require 'spec_helper'

describe Comment do
  describe "comment validation" do
    let(:comment) { FactoryGirl.build(:comment)}
    before do
      comment.user = FactoryGirl.create :user
      item = FactoryGirl.build :item
      item.owner = FactoryGirl.create :user
      item.save
      comment.item = item
    end
    it "validates user presence" do
      comment.valid?.should be_true

      comment.user = nil
      comment.valid?.should be_false
    end
    it "validates item presence" do
      comment.valid?.should be_true

      comment.item = nil
      comment.valid?.should be_false
    end
    it "validates comment" do
      comment.valid?.should be_true

      comment.comment = ""
      comment.valid?.should be_false
    end
  end
end
