class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  has_paper_trail

  def text
    to_s
  end
end
