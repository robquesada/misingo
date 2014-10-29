class LostReport < ActiveRecord::Base
	belongs_to :province
	belongs_to :pet
	validates_format_of :owner, :with => /^([a-zA-Z]+\s)*[a-zA-Z]+$/, multiline: true
	validates_format_of :phone_number1, :with => /\d{8}/
	validates_format_of :phone_number2, :with => /\d{8}/, allow_blank: true
end
