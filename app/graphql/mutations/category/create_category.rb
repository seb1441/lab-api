class Mutations::Category::CreateCategory < Mutations::BaseMutation
  null true

  field :category, Types::CategoryType, null: false
  field :errors, [String], null: false

  def resolve
    title = "Category #{::Category.count + 1}"
    position = ::Category.maximum(:position) + 1

    new_category = ::Category.create(title: title, position: position)
    {
      category: new_category,
      errors: []
    }
  end
end