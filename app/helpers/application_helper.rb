# Helper for Application
module ApplicationHelper
  def datetime_format(date)
    l(date) if date
  end

  def generate_model_for_url(model)
    if model.class.superclass == ApplicationRecord
      model
    else
      model.becomes(model.class.superclass)
    end
  end

  def add_status(option_selected)
    {
      0 => :secondary,
      1 => :warning,
      2 => :success
    }
    content_tag(:span,
                t("enums.work_order.status.#{option_selected}"),
                class: "badge bg-label bg-primary")
  end
end
