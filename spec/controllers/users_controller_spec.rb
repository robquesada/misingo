require 'rails_helper'

describe UsersController do
  
  login_user

  describe "GET index" do
    it "should have a current_user" do
      expect(subject.current_user).to_not be_nil
    end

    it "renders the index template" do
      expect(get :index).to render_template("index")
    end
  end
end
