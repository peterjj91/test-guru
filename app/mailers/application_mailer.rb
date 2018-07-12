class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_USERNAME']||%{"TestGuru" <mail@testguru.com>}
  layout 'mailer'
end
