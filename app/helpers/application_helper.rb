# Helper for Application
module ApplicationHelper
  def generate_model_for_url(model)
    if (model.class.superclass != ApplicationRecord)
      model.becomes(model.class.superclass)
    else
      model
    end
  end
end