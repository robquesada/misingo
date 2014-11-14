class LostReport < ActiveRecord::Base
  belongs_to :province
  belongs_to :pet
  serialize :phone_numbers

  delegate :name, to: :pet, prefix: true
  delegate :avatar, to: :pet, prefix: true
  delegate :breed_name, to: :pet, prefix: true
  delegate :name, to: :province, prefix: true
  delegate :animal_type_name, to: :pet

  before_save :titleize_owner

  validates_format_of :owner, :with => /^([a-zA-Z]+\s)*[a-zA-Z]+$/, multiline: true
  validates :phone_numbers, phone_number: true
  validates_presence_of :address, :description

  def phone_numbers
    (super || []).reject(&:blank?) 
  end
  
  private

  def titleize_owner
    self.owner = self.owner.titleize
  end

end
