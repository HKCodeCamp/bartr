require 'spec_helper'

describe ItemsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end
  let(:item) { i = FactoryGirl.build(:item); i.owner = FactoryGirl.create(:user); i.save; i}

  describe "POST 'interested_in'" do
    it "should add interest" do
      n = item.interests.count
      post 'interested_in', :id => item.id

      item.interests(true).count.should eq(n + 1)
    end
  end

  describe "POST 'not_interested_in'" do
    it "should remove interest" do
      i = item.interests.create(:user_id => current_user.id)
      current_user.should be_is_interested_in(item)
      post 'not_interested_in', :id => item.id

      current_user.interests(true) # reload
      current_user.should_not be_is_interested_in(item)
      end
  end

end
