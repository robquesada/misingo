module UserStepHelpers
  def log_in_as(user)
    @user = user
    visit new_user_session_path
    fill_in("user_email", with: @user.email)
    fill_in("user_password", with: @user.password)
    click_button("Iniciar")
  end
end

World(UserStepHelpers)

Given(/^I'm a logged in user$/) do
  log_in_as(FactoryGirl.create(:user))
end
