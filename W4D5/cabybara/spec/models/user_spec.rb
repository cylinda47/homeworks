require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(
                  email: "test@123.com",
                  password: "password_testing"
                ) }

   it { should validate_presence_of(:email) }
   it { should validate_presence_of(:password_digest) }
   it { should validate_length_of(:password).is_at_least(6) }

   describe "#is_password?" do
     it "verifies a valid password" do
       expect(user.is_password?("password_testing")).to be true
     end

     it "verifies an invalid password" do
       expect(user.is_password?("randompw")).to be false
     end
   end

   describe "#reset_session_token!" do
     it "sets a new session token on the user" do
       user.valid?
       prev_session_token = user.session_token
       user.reset_session_token!
       expect(user.session_token).to_not eq(prev_session_token)
     end

     it "returns the new session token" do
       expect(user.reset_session_token!).to eq(user.session_token)
     end
   end

   describe "::find_by_credentials" do
     before { user.save! }

     it "returns user given good credentials" do
       expect(User.find_by_credentials("test@123.com", "password_testing")).to eq(user)
     end

     it "returns nil given bad credentials" do
       expect(User.find_by_credentials("test@123.com", "bad_password")).to eq(nil)
     end
   end
end
