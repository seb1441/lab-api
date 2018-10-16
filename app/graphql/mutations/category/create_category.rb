class Mutations::Category::CreateCategory < Mutations::BaseMutation
  null true

  field :category, Types::CategoryType, null: false
  field :errors, [String], null: false

  def resolve
    position = (::Category.maximum(:position) || 0) + 1
    title = "Category #{position}"

    new_category = ::Category.create(title: title, position: position)
    {
      category: new_category,
      errors: []
    }
  end
end