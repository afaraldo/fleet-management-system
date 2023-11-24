require 'csv'

# Import Library
class Importer
  def self.import(file_path, model_class, organization_id, unique_by = [:id], excluded_columns = %w[id created_at updated_at],
                  col_sep = ';')
    models = []
    result = nil
    permitted_columns = model_class.column_names - excluded_columns

    CSV.foreach(file_path, headers: true, col_sep:) do |row|
      row_hash = row.to_hash
      row_hash["organization_id"] = organization_id

      models << row_hash.extract!(*permitted_columns)
    end

    ActiveRecord::Base.transaction do
      result = model_class.upsert_all(models, unique_by:)
    end

    Rails.logger.debug 'Data imported successfully!'
    result.rows.size
  rescue StandardError => e
    Rails.logger.error "Data cannot be imported: #{e.message}"
    0
  end
end
