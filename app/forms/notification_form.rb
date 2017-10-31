class NotificationForm
  include ActiveModel::Model

  attr_accessor :marketing, :articles, :digest, :email, :token

  def initialize
  end

  def submit(params)
    self.marketing = params[:marketing]
    self.articles = params[:articles]
    self.digest = params[:digest]

    email = params['email']
    token_string = params['token']
    @user = User.find_by email:email
    @token = Token.find_by nonce:token_string

    if @token.user_id == @user.id
      @user.marketing = marketing
      @user.articles = articles
      @user.digest = digest
      @user.save
      true
    else
      false
    end

  end


end
