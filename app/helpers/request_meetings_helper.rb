# encoding: UTF-8
module RequestMeetingsHelper
  def status status
    if status == 1
      '<span class="waiting">Ожидание подтверждения</span>'
    elsif status == 2
      '<span class="approved">Подтверждён</span>'
    elsif status == 3
      '<span class="declined">Отказано</span>'
    end
  end
end
