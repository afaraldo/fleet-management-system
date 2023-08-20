# This helper contains function for work_orders views
module WorkOrderHelper
  def generate_model_for_url(model)
    if model.class.superclass == ApplicationRecord
      model
    else
      model.becomes(model.class.superclass)
    end
  end

  def add_status(option_selected)
    content_tag(:span,
                t("enums.work_order.status.#{option_selected}"),
                class: 'badge bg-label bg-primary')
  end
end
