class Mutations::Level::CreateLevel < Mutations::BaseMutation
  null true

  field :level, Types::LevelType, null: false
  field :errors, [String], null: false

  def resolve
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    position = (::Level.maximum(:position) || 0) + 1
    title = "Level #{position}"

    new_level = ::Level.create(title: title, position: position)
    {
      level: new_level,
      errors: []
    }
  end
end