class Calendar < ApplicationRecord
  has_many :user_calendars
  has_many :menus


end
