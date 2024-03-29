# Main object ActiveRecord
class ApplicationRecord < ActiveRecord::Base
  include Discard::Model

  primary_abstract_class
  has_paper_trail

  def self.query_search
    -> {}
  end

  def text
    to_s
  end
end
