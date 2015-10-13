require 'rails_helper'

describe User, 'validations' do
  subject { FactoryGirl.create(:user) }

  it { should have_many(:pets).dependent(:destroy) }
  it { should_not allow_value('email@x').for(:email) }
  it { should_not allow_value('123123').for(:email) }
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string
#  uid                    :string
#  name                   :string
#  image                  :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
