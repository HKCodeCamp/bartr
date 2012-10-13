require 'spec_helper'

describe Bookmark do
  describe "bookmark validation" do
    let(:bookmark) { Bookmark.new }
    before do
      bookmark.user = FactoryGirl.create :user
      item = FactoryGirl.build :item
      item.owner = FactoryGirl.create :user
      item.save
      bookmark.item = item
    end
    it "validates user presence" do
      bookmark.valid?.should be_true

      bookmark.user = nil
      bookmark.valid?.should be_false
    end
    it "validates user/item uniqueness" do
      bookmark.save.should be_true
      duplicate_bookmark = bookmark.item.bookmarks.build(:user_id => bookmark.user_id)
      duplicate_bookmark.should_not be_valid
    end
    it "validates item presence" do
      bookmark.valid?.should be_true

      bookmark.item = nil
      bookmark.valid?.should be_false
    end
  end
end
