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
    color = if option_selected == 'finished'
              'bg-primary'
            elsif option_selected == 'authorized'
              'bg-warning'
            else
              'bg-info'
            end
    content_tag(:span,
                t("enums.work_order.status.#{option_selected}"),
                class: "badge bg-label #{color}")
  end
end
