# == Schema Information
#
# Table name: lost_reports
#
#  id            :integer          not null, primary key
#  address       :text
#  reward        :integer
#  owner         :string
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#  province_id   :integer
#  pet_id        :integer
#  phone_numbers :text
#

class LostReport < ActiveRecord::Base
  belongs_to :province
  belongs_to :pet
  serialize :phone_numbers

  before_validation :strip_phone_numbers

  delegate :name, :avatar, :breed_name, to: :pet, prefix: true
  delegate :animal_type_name, to: :pet

  validates :phone_numbers, phone_number: true
  validates_presence_of :address, :description

  default_scope { order('created_at DESC') }

  def phone_numbers
    (super || []).reject(&:blank?)
  end

  private

  def strip_phone_numbers
    stripped_phone_numbers = []
    phone_numbers.each do |phone_number|
      stripped_phone_numbers.push(phone_number.strip.gsub('-', '').gsub(' ', ''))
    end
    self.phone_numbers = stripped_phone_numbers
  end
end
