require 'rails_helper'

describe LostReportsController, "validations" do

  context "render templates" do
    it { expect(get :new).to render_template('new') }
  end
  
end
