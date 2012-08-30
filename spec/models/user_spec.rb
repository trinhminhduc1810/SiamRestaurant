require 'spec_helper'
describe User do
  let(:user) { FactoryGirl.create :user }

  context "#hash password for user" do
    it "should hash the original password" do
      user.hash_password(user.password).should_not == user.password
    end
  end
end
