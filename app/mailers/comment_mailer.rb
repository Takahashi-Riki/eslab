class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.send_when.subject
  #
  def send_when(user)

    @user = user
    mail to:      user.email,
         subject: '新しい添削が完了しました'
  end
end
