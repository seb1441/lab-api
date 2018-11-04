class Mutations::Level::DestroyLevel < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :level, Types::LevelType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    errors = []

    level_destroyed = ::Level.find_by(id: id)

    if level_destroyed
      level_destroyed.destroy
    else
      errors.push "Level not found"
    end

    {
      level: level_destroyed,
      errors: errors
    }
  end
end