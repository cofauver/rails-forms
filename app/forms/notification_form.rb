class NotificationForm
  include ActiveModel::Model
  include ActiveModel::Validations

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

    # check that the token matches the user!
    if @token.user_id == @user.id

      @user.email = email
      @user.marketing = marketing
      @user.articles = articles
      @user.digest = digest


      if @user.valid?
        Token.consume(@token.nonce)

        Token.generate(@user)
        # generate a token so that the demo doesn't run out of tokens
        # for editing the user
        @user.save!
        true
      else
        current_error = @user.errors.full_messages.to_sentence
        errors.add :email, current_error
        false
      end
    else
      false
    end

  end



end
