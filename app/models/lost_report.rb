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

  accepts_nested_attributes_for :pet, allow_destroy: true

  def phone_numbers
    (super || []).reject(&:blank?)
  end

  private

  def strip_phone_numbers
    self.phone_numbers = phone_numbers.map { |phone_number| phone_number.delete('^0-9') }
  end
end

# == Schema Information
#
# Table name: lost_reports
#
#  id            :integer          not null, primary key
#  address       :text
#  reward        :integer
#  owner         :string(255)
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#  province_id   :integer
#  pet_id        :integer
#  phone_numbers :text
#
