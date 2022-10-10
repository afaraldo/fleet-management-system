# Helper for Login
module ApplicationHelper
  def datetime_format(date)
    l(date) if date
  end
end