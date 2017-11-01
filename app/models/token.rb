class Token < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :nonce, presence: true

  def self.generate user
    nonce = SecureRandom.urlsafe_base64(32)
    Token.create({user: user, nonce: nonce})

    # Here, I was thinking about doing some type checking to make sure
    # I'm being passed a User instance, but the error that active record
    # provides upon create is so informative that I didn't think I could
    # do better.

    # It looks like:
    # ** AssociationTypeMismatch: User(#70245902722180) expected, got
    # "hey" which is an instance of String(#70245901827840) **

    # Otherwise I would have put in some conditional like so:
    # if  user.class == User
    #   do the create steps above
    # else
    #   flash[:error] = 'to generate a Token, your method call must provide an instance of the User class as an argument'
    # end
  end

  def self.consume nonce
    token = Token.find_by nonce: nonce
    if token.nil?
      nil
    else
      user = token.user
      Token.delete(token.id)
      user
    end
  end

end
