# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  params          :jsonb
#  read_at         :datetime
#  recipient_type  :string           not null
#  type            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#  recipient_id    :bigint           not null
#
# Indexes
#
#  index_notifications_on_organization_id  (organization_id)
#  index_notifications_on_read_at          (read_at)
#  index_notifications_on_recipient        (recipient_type,recipient_id)
#
FactoryBot.define do
  factory :notification do
    recipient { nil }
    type { "" }
    params { "" }
    read_at { "2022-12-01 09:09:00" }
  end
end
