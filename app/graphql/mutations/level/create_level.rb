class Mutations::Level::CreateLevel < Mutations::BaseMutation
  null true

  field :level, Types::LevelType, null: false
  field :errors, [String], null: false

  def resolve
    title = "Level #{::Level.count + 1}"
    position = ::Level.maximum(:position) + 1

    new_level = ::Level.create(title: title, position: position)
    {
      level: new_level,
      errors: []
    }
  end
end