class CalendarController < ApplicationController

  def index
    @usercalendar = UserCalendar.find_by(user_id: current_user.id)
    raise if @usercalendar.nil?

    @calendar = @usercalendar.calendar
    raise if @calendar.nil?

    @menus = Menu.where(calendar_id: @calendar.id)
  end

end
