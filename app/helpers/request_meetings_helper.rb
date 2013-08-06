# encoding: UTF-8
module RequestMeetingsHelper
  def status status
    if status == 1
      content_tag :span, class: 'waiting' do
        "Ожидание подтверждения"
      end
    elsif status == 2
      content_tag :span, class: 'approved' do
        "Подтверждена администратором. Ожидается подтверждение адвоката"
      end
    elsif status == 3
      content_tag :span, class: 'approved' do
        "Подтверждена"
      end
    elsif status == 4
      content_tag :span, class: 'declined' do
        "Отказано"
      end
    end
  end
end
