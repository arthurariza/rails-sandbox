class TestMailer < ApplicationMailer
  def test_email
    mail(to: 'john@doe.com', subject: 'This is a test email')
  end
end
