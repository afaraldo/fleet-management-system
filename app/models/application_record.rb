# Main object ActiveRecord
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  has_paper_trail

  alias text to_s
end
