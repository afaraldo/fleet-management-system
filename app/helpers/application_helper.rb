# Helper for Application
module ApplicationHelper
  def generate_model_for_url(model)
    if model.class.superclass == ApplicationRecord
      model
    else
      model.becomes(model.class.superclass)
    end
  end
end
