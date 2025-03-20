class CalendarController < ApplicationController

  def index
    @usercalendar = UserCalendar.find_by(user_id: current_user.id)
    @calendar = @usercalendar.calendar
    @menus = Menu.where(calendar_id: @calendar.id).where('date >= ?', Date.today).order(date: :asc)
  end

end
