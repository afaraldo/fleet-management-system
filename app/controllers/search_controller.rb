# Searcher Controller
class SearchController < ApplicationController
  def index
    query = params[:query]
    @results = []

    ActiveRecord::Base.descendants.each do |model|
      next unless model.respond_to?(:algolia_search)
      next if query.blank?

      @results += model.algolia_search(query).map do |result|
        model_name = I18n.t("activerecord.models.#{model.name.underscore}.one")
        title = result.try(:title) || result.id
        description = result.try(:description) || 'No description available'
        icon = result.try(:icon) || 'https://fleet-management-system-development.s3.us-east-2.amazonaws.com/default/coche.png'
        url = url_for(result)

        result.attributes.merge(
          model_name:,
          title:,
          description:,
          icon:,
          url:
        )
      end
    end

    respond_to do |format|
      format.json { render json: @results }
    end
  end
end
