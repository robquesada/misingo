Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.secret_key = '9bfd4d0adbdc96c2de761dea936ca035a722cc43be1889f97db217e21be2a11d54efb3cf3400ede06d202b547b0a826aea0dc44c1f12bc8d426ecaabefeb77fd'
  
  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [ :http_auth ]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
  {
    scope: 'public_profile,email,user_friends',
    display: 'popup',
    image_size: { 'width' => 75, 'height' => 75 },
    client_options: { :ssl => { :ca_file => '/usr/lib/ssl/certs/ca-certificates.crt' } }
  }
end
