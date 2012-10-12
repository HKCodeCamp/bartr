require 'spec_helper'

describe "User::Adminable" do
  let (:john) { FactoryGirl.create(:user) }

  describe "#send_verification_sms" do
    it "should send verification SMS to user mobile number" do
      stub_messages = stub(:twilio_messages)
      stub_messages.should_receive(:create) do |created_msg|
        created_msg[:from].should_not be_nil
        created_msg[:to].should   == "+#{john.mobile_no}"
        created_msg[:body].should =~ /1234/
      end
      User.stub_chain(:twilio_client, :account, :sms, :messages).and_return(stub_messages)

      john.send_verification_sms
    end
  end
end
