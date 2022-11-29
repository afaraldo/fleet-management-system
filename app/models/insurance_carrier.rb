# This class represents a InsuranceCarrier
class InsuranceCarrier < Supplier
  has_many :insurance_plans, dependent: :destroy

  def to_s
    name
  end
end
