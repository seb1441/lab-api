class Types::MutationType < Types::BaseObject
  # TODO: remove me
  # field :test_field, String, null: false,
  #   description: "An example field added by the generator"
  # def test_field
  #   "Hello World"
  # end

  field :sign_in_user, Types::AuthenticateType, null: true do
    argument :email, String, required: true
    argument :password, String, required: true
  end
  def sign_in_user(email:, password:)
    user = User.find_by(email: email)
    return unless user
    return unless user.authenticate(password)

    {
      token: AuthToken.token(user),
      user: user
    }
  end
end
