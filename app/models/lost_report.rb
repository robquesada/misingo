class LostReport < ActiveRecord::Base
  belongs_to :province
  belongs_to :pet

  before_save :titleize_owner

  validates_format_of :owner, :with => /^([a-zA-Z]+\s)*[a-zA-Z]+$/, multiline: true
  validates_format_of :phone_number1, :with => /^\d{8}$/, multiline: true
  validates_format_of :phone_number2, :with => /^\d{8}$/, multiline: true, allow_blank: true
  validates :address, :description, presence: true

  private

  def titleize_owner
    self.owner = self.owner.titleize
  end
end