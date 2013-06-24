require 'spec_helper'

describe UsersController do

  describe "Common user" do
    describe "access denied for users actions" do
      before (:each) do
        @user = FactoryGirl.create(:common_user)
        sign_in @user
      end
    end
  end

end