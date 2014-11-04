require 'rails_helper'

describe LostReport, "validations" do
  it "validates all the expected fields" do
    lost_report = LostReport.new(owner: "Pepe",
                                 description: "Es grande",
                                 phone_number1: 12345678,
                                 phone_number2: 12345678,
                                 reward: 1)

    expect(lost_report.owner).to eq "Pepe"
    expect(lost_report.description).to eq "Es grande"
    expect(lost_report).to be_valid
  end

  it "validates owner name and last name" do
    lost_report = LostReport.new(owner: "Pepe Soto",
                                 phone_number1: 12345678,
                                 phone_number2: 12345678)

    expect(lost_report).to be_valid
  end

  it "validates owner name" do
    lost_report = LostReport.new(owner: 123,
                                 phone_number1: 12345678,
                                 phone_number2: 12345678)

    expect(lost_report).to_not be_valid
  end

  it "validates phone numbers with only 8 digits" do
    lost_report = LostReport.new(owner: "Pepe",
                                 phone_number1: 123234533,
                                 phone_number2: 12345678)

    expect(lost_report).to_not be_valid
  end
end