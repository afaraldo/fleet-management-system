# Searcher Controller
class SearcherController < ApplicationController
  def search
    @q = params[:q]
    @results = perform_search
  end

  private

  def perform_search
    # Obtén todos los modelos del proyecto
    models = ApplicationRecord.descendants.collect(&:name).map(&:constantize)

    # Inicializa una nueva consulta Ransack combinando las consultas de búsqueda de todos los modelos
    combined_query = models.inject([]) do |query, model|
      query << model.query_search
    end

    # Ejecuta la consulta combinada y obtén los resultados
    combined_query.flatten
  end
end
