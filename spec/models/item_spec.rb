require 'spec_helper'

describe Item do
  describe "item validation" do
    let(:item) { FactoryGirl.build(:item)}
    it "price validation" do 
      item.valid?.should be_true

      item.price = -10
      item.valid?.should be_false

      item.price = 10.1
      item.valid?.should be_false

      item.price = 0.01
      item.valid?.should be_false
    end

    it "title validation" do
      item.title = ""
      item.valid?.should be_false

      item.title = "Hello"
      item.valid?.should be_true

      item.title = "H"
      item.valid?.should be_false
    end

    it "desc validation" do
      item.desc = ""
      item.valid?.should be_false

      item.desc = "Hello"
      item.valid?.should be_true

      item.desc = "H"
      item.valid?.should be_false
    end
  end
end
