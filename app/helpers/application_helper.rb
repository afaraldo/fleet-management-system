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
end
