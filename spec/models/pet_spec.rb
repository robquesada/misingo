require 'rails_helper'

describe Pet do
    let(:pet) { Pet.new(name: 'Mas123') }   
    subject { pet }
    
    it { expect(pet).to_not be_valid }
end