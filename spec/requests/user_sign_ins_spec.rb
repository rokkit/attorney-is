require 'spec_helper'

describe "UserSignIns" do
  let(:user) { FactoryGirl.create :user }
  subject { page }
  describe "redirect user when not authorized" do
    before do
      visit meetings_path
    end
    specify { current_path.should eq new_user_session_path }
  end
  describe "log in" do
    describe "allow user log in with valid cred" do
      before do 
        visit new_user_session_path
        fill_in "Почта", with: user.email
        fill_in "Пароль", with: 'password'
        click_button "Вход"
      end
      it { should have_content "Заседания" }
      it { should have_content "Приветствуем!" }
    end
    describe "not allow user log in with invalid cred" do
      before do 
        visit new_user_session_path
        fill_in "Почта", with: user.email
        fill_in "Пароль", with: 'invalidpassword'
        click_button "Вход"
      end
      specify { current_path.should eq new_user_session_path }
    end
  end
  describe "common user" do
    let(:common_user) { FactoryGirl.create :common_user }
    before do
      login_as(user, :scope => :user)
    end
    describe "access denied on private pages" do
      before { visit users_path }
      specify { current_path.should eq root_path }
    end
  end
end
