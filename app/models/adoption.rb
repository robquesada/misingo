class Adoption < ActiveRecord::Base
  paginates_per 12

  belongs_to :province
  belongs_to :pet
  belongs_to :user
  accepts_nested_attributes_for :pet, allow_destroy: true

  delegate :name, :avatar, :breed_name, to: :pet, prefix: true
  delegate :animal_type_name, to: :pet

  serialize :phone_numbers
  before_validation :strip_phone_numbers
  validates :phone_numbers, phone_number: true
  validates_presence_of :contact, :description

  default_scope { order('created_at DESC') }

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
# Table name: adoptions
#
#  id            :integer          not null, primary key
#  description   :text
#  contact       :string
#  phone_numbers :text
#  province_id   :integer
#  pet_id        :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  adopted       :boolean          default(FALSE)
#
