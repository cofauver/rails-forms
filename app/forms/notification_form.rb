class NotificationForm
  include ActiveModel::Model

  attr_accessor :marketing, :articles, :digest, :email, :original_email

  def initialize
  end

  def submit(params)
    self.original_email = params[:original_email]

    self.email = params[:email]
    self.marketing = params[:marketing]
    self.articles = params[:articles]
    self.digest = params[:digest]

    email = params['email']
    token_string = params['token']
    @user = User.find_by email:original_email
    @token = Token.find_by nonce:token_string

    if valid? && @token.user_id == @user.id
      @user.email = email
      @user.marketing = marketing
      @user.articles = articles
      @user.digest = digest
      @token.consume

      @token.generate
      # generate a token so that the demo doesn't run out of tokens
      # for editing the user
      @user.save
      true
    else
      false
    end

  end

end
