class Invite < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

end

# == Schema Information
#
# Table name: invites
#
#  id      :integer          not null, primary key
#  email   :string
#  comment :text
#
