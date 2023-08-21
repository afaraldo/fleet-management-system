# Preview all emails at http://localhost:3000/rails/mailers/insurance_plan
class InsurancePlanPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/insurance_plan/insurance_plans_to_expire
  def insurance_plans_to_expire
    InsurancePlanMailer.insurance_plans_to_expire
  end

end
