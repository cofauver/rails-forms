class NotificationsController < ApplicationController

  def new
    email = params['email']
    token_string = params['token']
    @user = User.find_by email:email
    @token = Token.find_by nonce:token_string
    @notification_form = NotificationForm.new(User.find_by email:email)

  end

  def edit
    email = params['email']
    token_string = params['token']
    @user = User.find_by email:email
    @token = Token.find_by nonce:token_string
  end

end
