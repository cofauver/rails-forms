class Token < ApplicationRecord
  belongs_to :user

  def self.generate (user)
    if  user.class == User
      puts 'success'
      nonce = SecureRandom.urlsafe_base64(32)
      Token.create({user: user, nonce:nonce})
    else

    end
  end

  def self.consume
    puts 'consume method'
  end

end
