# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => 587,
    :user_name => "eslab.official@gmail.com",
    #:password => "takahashiriki",
    :password => "njszbwrhrgzxmkal",
    :authentication => :plain
}