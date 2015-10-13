require 'rails_helper'

describe Invite do
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end

# == Schema Information
#
# Table name: invites
#
#  id      :integer          not null, primary key
#  email   :string
#  comment :text
#
