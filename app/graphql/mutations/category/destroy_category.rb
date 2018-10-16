class Mutations::Category::DestroyCategory < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :category, Types::CategoryType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    errors = []

    category_destroyed = ::Category.find_by(id: id)

    if category_destroyed
      category_destroyed.destroy
    else
      errors.push "Category not found"
    end

    {
      category: category_destroyed,
      errors: errors
    }
  end
end