class LostReport < ActiveRecord::Base
  belongs_to :province
  belongs_to :pet
  serialize :phone_numbers

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
