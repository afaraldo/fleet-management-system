# == Schema Information
#
# Table name: suppliers
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  name         :string           not null
#  ruc          :string           not null
#  type         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_suppliers_on_discarded_at  (discarded_at)
#
class InsuranceCarrier < Supplier
  include AlgoliaSearch
  has_many :insurance_plans, dependent: :destroy

  def to_s
    name
  end

  algoliasearch enqueue: true, disable_indexing: Rails.env.test? do
    attributes :name, :ruc, :title, :description

    # the `searchableAttributes` (formerly known as attributesToIndex) setting defines the attributes
    # you want to search in: here `title`, `subtitle` & `description`.
    # You need to list them by order of importance. `description` is tagged as
    # `unordered` to avoid taking the position of a match into account in that attribute.
    searchableAttributes %w[name last_name document]
  end

  def title
    name.to_s
  end
  def to_s
    "Nro: #{id}"
  end
  def description
    ruc.to_s
  end
end
