module MeetingsHelper
  def current_month? month
    month.to_s == Date.today.strftime("%m")
  end
end
