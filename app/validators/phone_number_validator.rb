class PhoneNumberValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute, value)
    phone_number_present(record, attribute, value)
    phone_number_format(record, attribute, value)
  end

  private 

  def phone_number_present(record, attribute, value)
    if value.empty?
      locale_blank_path = "activerecord.errors.models.lost_report.attributes.phone_numbers.blank"
      record.errors.add(attribute, I18n.t(locale_blank_path))
    end
  end

  def phone_number_format(record, attribute, value)
    value.each_with_index do |phone_number, index|
      if !(phone_number =~ /^\d{8}$/)
        locale_invalid_path = "activerecord.errors.models.lost_report.attributes.phone_numbers.invalid"
        record.errors.add(attribute, I18n.t(locale_invalid_path).gsub("%{index}", index.next.to_s))
      end
    end
  end

end
