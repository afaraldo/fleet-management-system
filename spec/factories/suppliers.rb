FactoryBot.define do
  factory :supplier do
        initialize_with { type.present? ? type.constantize.new : Supplier.new }
  end

    # call examples
    FactoryBot.build(:supplier) #=> Invoice
    FactoryBot.build(:supplier, :InsuranceCarrier)
    #=> InvoiceAdditionalCost
end
