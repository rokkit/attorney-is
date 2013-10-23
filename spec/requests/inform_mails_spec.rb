require 'spec_helper'

describe "InformMails" do
  describe "GET /inform_mails" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get inform_mails_path
      response.status.should be(200)
    end
  end
end
