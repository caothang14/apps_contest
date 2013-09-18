OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '245448955591665', '667d1cab66a794631027d6276e57b51a', {:scope => 'read_stream, friends_likes'}
end

