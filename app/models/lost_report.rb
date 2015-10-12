class LostReport < ActiveRecord::Base
  belongs_to :province
  belongs_to :pet
  serialize :phone_numbers

  delegate :name, :avatar, :breed_name, to: :pet, prefix: true
  delegate :animal_type_name, to: :pet

  validates :phone_numbers, phone_number: true
  validates_presence_of :address, :description

  default_scope { order('created_at DESC') }

  accepts_nested_attributes_for :pet, allow_destroy: true

  def phone_numbers
    (super || []).reject(&:blank?)
  end
end
