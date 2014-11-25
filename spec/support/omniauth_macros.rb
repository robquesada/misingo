module OmniauthMacros
  def facebook_user_hash
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      provider: :facebook,
      uid: '12345',
      info: { name: 'Joe' }
    )
  end
end
