class LostReport < ActiveRecord::Base
  belongs_to :province
  belongs_to :pet
  serialize :phone_numbers

  before_save :titleize_owner

  validates_format_of :owner, :with => /^([a-zA-Z]+\s)*[a-zA-Z]+$/, multiline: true
  validate :phone_numbers_present, :phone_numbers_format
  validates :address, :description, presence: true

  def phone_numbers
    (super || []).reject(&:blank?) 
  end
  
  private

  def titleize_owner
    self.owner = self.owner.titleize
  end

  def phone_numbers_format
    phone_numbers.each_with_index do |number, index|
      if !(number =~ /^\d{8}$/)
        locale_invalid_path = "activerecord.errors.models.lost_report.attributes.phone_numbers.invalid"
        errors.add(:phone_numbers, I18n.t(locale_invalid_path).gsub("%{index}", index.next.to_s))
      end
    end
  end

  def phone_numbers_present
    if phone_numbers.empty?
      locale_blank_path = "activerecord.errors.models.lost_report.attributes.phone_numbers.blank"
      errors.add(:phone_numbers, I18n.t(locale_blank_path))
    end
  end
end
