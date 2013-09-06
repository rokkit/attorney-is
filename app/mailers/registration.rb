class Registration < ActionMailer::Base
  default from: "from@example.com"

  def welcome user, password
    @user = user
    @password = password
  end
end
