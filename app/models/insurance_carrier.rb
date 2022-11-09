class InsuranceCarrier < Supplier
  has_many :insurance_plans, dependent: :destroy
end
