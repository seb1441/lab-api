class Mutations::Level::UpdateLevels < Mutations::BaseMutation
  class LevelInput < Types::BaseInputObject
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :position, Integer, required: false
  end

  null true

  argument :levels, [LevelInput], required: true

  field :levels, [Types::LevelType], null: false
  field :errors, [String], null: false

  def resolve(levels:)
    updated_levels = []

    levels.each do |level|
      next unless lvl = ::Level.find_by(id: level.id)

      lvl.title = level.title if level.title
      lvl.description = level.description if level.description
      lvl.position = level.position if level.position

      lvl.save

      updated_levels << lvl
    end

    {
      levels: updated_levels,
      errors: []
    }
  end
end