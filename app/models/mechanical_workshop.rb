# == Schema Information
#
# Table name: suppliers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  ruc        :string           not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MechanicalWorkshop < Supplier
  def to_s
    name
  end
end
