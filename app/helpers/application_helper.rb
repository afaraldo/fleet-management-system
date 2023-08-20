# Helper for Application
module ApplicationHelper
  include SimpleFormRansackHelper # Usage for https://github.com/kaspernj/simple_form_ransack

  def datetime_format(date)
    l(date) if date
  end
end
