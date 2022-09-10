module Error
  # Error module to Handle errors globally
  # include Error::ErrorHandler in application_controller.rb
  module ErrorHandler
    extend ActiveSupport::Concern

    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
      end
    end

    private

    def record_not_found(exception)
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: exception.record.errors, status: :unprocessable_entity }
      end
    end

    def record_invalid(exception)
      instance_variable_set "@#{resource_name}", exception.record

      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: exception.record.errors, status: :unprocessable_entity }
      end
    end
  end
end
