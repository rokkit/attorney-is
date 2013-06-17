# encoding: UTF-8
module RequestMeetingsHelper
  def status status
    if status == 1
      "Ожидание подтверждения"
    elsif status == 2
      "Подтверждён"
    elsif status == 3
      "Отказано"
    end
  end
end
