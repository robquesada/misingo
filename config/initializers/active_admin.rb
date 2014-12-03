ActiveAdmin.setup do |config|
  config.before_filter { I18n.locale = 'en' }

  config.site_title = 'Pet Project'
  
  config.authentication_method = :authenticate_admin_user!

  config.current_user_method = :current_admin_user

  config.logout_link_path = :destroy_admin_user_session_path

  config.batch_actions = true
end
