class MainController < ApplicationController

  def index
    @user = User.first
    @token = Token.find_by user_id:@user.id
  end

end
