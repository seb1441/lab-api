module AuthToken
  extend self

  def key
    Rails.application.credentials.secret_key_base
  end

  def token(user)
    payload = {user_id: user.id}
    JsonWebToken.sign(payload, key: key)
  end

  def verify(token)
    result = JsonWebToken.verify(token, key: key)
    return nil if result[:error]
    User.find_by(id: result[:ok][:user_id])
  end
end