# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :user_name => "<%= ENV['DB_USERNAME'] %>",
    :password => "<%= ENV['DB_PASSWORD'] %>",
    :authentication => :plain
}