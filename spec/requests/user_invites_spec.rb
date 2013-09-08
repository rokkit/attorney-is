# encoding: utf-8

require 'spec_helper'

describe "UserInvites" do
  describe "GET /user_invites" do
    let(:admin) { User.create! phone: 79523707281, email: "admin@example.com", password: "word", register_number: "123", roles:[  Role.find_or_create_by_name('admin')], fio: "FIO" }
    before(:each) { login_as(admin, :scope => :user) }
    it "invited user" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get new_user_path
      page.should have_content("Приглашение адвоката")
      save_and_open_page
      fill_in "user[fio]", with: "Common Man"
      fill_in "user_phone", with: "79523707281"
      fill_in 'user_register_number', with: "359"
      fill_in 'user_email', with: "ema@example.com"
      choose("Адвокат")
      click_button('Добавить')
      response.status.should be(200)
    end
  end
end
