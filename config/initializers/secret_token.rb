# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
    if Rails.env.development? or Rails.env.test?
      VinylTracker::Application.config.secret_token = '48a223074bca4c28a1a922673082e57b1faf1df6f0e0f5135b4664c13f45db65e2697891663ea81742d57d630ccfd0f1804651159aaa16fec6a45f614fd8046a'
    else
      VinylTracker::Application.config.secret_token = ENV['SECRET_TOKEN']
    end
