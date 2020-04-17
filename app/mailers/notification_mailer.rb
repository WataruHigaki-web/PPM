# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def send_confirm_to_user(user)
    @user = user
    mail(
      from: 'hogehoge@example.com',
      subject: '会員登録が完了しました。',
      to: @user.email, &:text
    )
  end

  def send_complete_to_user(user, order)
    @user = user
    @order = order
    mail(
      from: 'hogehoge@example.com',
      subject: '注文予約完了しました。',
      to: @user.email, &:text
    )
  end
end
