# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  discarded_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  profile_foto           :string
#  receive_notifications  :boolean          default(FALSE), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  organization_id        :bigint
#
# Indexes
#
#  index_users_on_discarded_at               (discarded_at)
#  index_users_on_email                      (email)
#  index_users_on_email_and_organization_id  (email,organization_id) UNIQUE
#  index_users_on_organization_id            (organization_id)
#  index_users_on_reset_password_token       (reset_password_token)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
    it { should validate_presence_of :email }

  end
end
