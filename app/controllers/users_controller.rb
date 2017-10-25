class UsersController < ApplicationController
  def settings
    email = params['email']
    token_string = params['token']
    @user = User.find_by email:email
    @token = Token.find_by nonce:token_string
  end
end
