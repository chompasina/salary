Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :slack, ENV['SLACK_KEY'], ENV['SLACK_SECRET'], scope: 'identity.basic', name: :sign_in_with_slack
  provider :slack, ENV['SLACK_KEY'], ENV['SLACK_SECRET'], scope: 'team:read,users:read,identify,post,bot', team: 'T029P2S9M'
end