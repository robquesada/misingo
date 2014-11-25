require 'rails_helper'

class Validatable
  include ActiveModel::Validations
  validates_with PhoneNumberValidator, attributes: :phone_numbers
  attr_accessor :phone_numbers
end

describe PhoneNumberValidator do
  subject { Validatable.new }

  context 'without phone numbers' do
    before { allow(subject).to receive(:phone_numbers).and_return([]) }
    it { should_not be_valid }
  end

  context 'with valid phone numbers' do
    before { allow(subject).to receive(:phone_numbers).and_return(%w(85423423 12345678)) }
    it { should be_valid }
  end

  context 'with invalid phone numbers' do
    before { allow(subject).to receive(:phone_numbers).and_return(%w(abc 12345678)) }
    it { should_not be_valid }
  end
end
