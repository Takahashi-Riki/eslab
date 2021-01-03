require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
  test "send_when" do
    mail = CommentMailer.send_when
    assert_equal "Send when", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
