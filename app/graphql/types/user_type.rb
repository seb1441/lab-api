class Types::UserType < Types::BaseObject
  field :id, ID, null: false
  field :email, String, null: false
  field :username, String, null: false
end