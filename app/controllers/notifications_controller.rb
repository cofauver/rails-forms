class NotificationsController < ApplicationController

  def new
    @email = params['email']
    @token_string = params['token']
    @notification_form = NotificationForm.new
  end

  def edit
    @notification_form = NotificationForm.new
    if @notification_form.submit(params[:notification_form])
      redirect_to users_path , notice: 'Successfully changed notification settings'
    else
      render "new"
    end
  end

end
