module CalendarHelper
  
  def russian_month month
    case month
      when '01'
        "Январь"
      when '02'
        "Ферваль"
      when '03'
        "Март"
      when '04'
        "Апрель"
      when '05'
        "Май"
      when '06'
        "Июнь"
      when '07'
        "Июль"
      when '08'
        "Август"
      when '09'
        "Сентябрь"
      when '10'
        "Октябрь"
      when '11'
        "Ноябрь"
      when '12'
        "Декабрь"
    end
  end
  
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end

  class Calendar < Struct.new(:view, :date, :callback)
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
      classes.empty? ? nil : classes.join(" ")
    end
    def weeks
          first = date.beginning_of_month.beginning_of_week(START_DAY)
          last = date.end_of_month.end_of_week(START_DAY)
          (first..last).to_a.in_groups_of(7)
    end
  end
end