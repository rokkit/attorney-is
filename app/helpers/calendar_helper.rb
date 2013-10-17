module CalendarHelper
  
  def russian_months
    months = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
  end
  def russian_month month
    months = russian_months
    months[month.to_i - 1]
  end
  
  def calendar(date = Date.today, meetings_by_date, &block)
    Calendar.new(self, date, meetings_by_date, block).table
  end

  class Calendar < Struct.new(:view, :date, :meetings_by_date, :callback)
    #HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    HEADER = %w[Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье]
    START_DAY = :monday

    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendar" do
        header + week_rows
      end
    end

    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes << "weekend" if ['Sun', 'Sat'].include?(day.strftime("%a"))
      classes << "date-cell"
      classes << 'avaible' if meetings_by_date[day].try {|mbd| mbd.first.user.nil?}
      classes << 'not_avaible' if meetings_by_date[day].try {|mbd| mbd.first.user.present?}
      
      
      classes.empty? ? nil : classes.join(" ")
    end
    def weeks
          first = date.beginning_of_month.beginning_of_week(START_DAY)
          last = date.end_of_month.end_of_week(START_DAY)
          (first..last).to_a.in_groups_of(7)
    end
  end
end