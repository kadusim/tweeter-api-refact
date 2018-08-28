Rails.application.routes.draw do
  scope 'api' do
    get :most_relevants, to: 'support_tweets#most_relevants'
    get :most_mentions,  to: 'support_tweets#most_mentions'
  end
end
