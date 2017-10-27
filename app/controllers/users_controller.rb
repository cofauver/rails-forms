class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    email = params['email']
    token_string = params['token']
    @user = User.find_by email:email
    @token = Token.find_by nonce:token_string
  end
  def update
    
  end
end
