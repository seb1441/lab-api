class Mutations::Category::UpdateCategories < Mutations::BaseMutation
  class CategoryInput < Types::BaseInputObject
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :position, Integer, required: false
  end

  null true

  argument :categories, [CategoryInput], required: true

  field :categories, [Types::CategoryType], null: false
  field :errors, [String], null: false

  def resolve(categories:)
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    updated_categories = []

    categories.each do |category|
      next unless cat = ::Category.find_by(id: category.id)

      cat.title = category.title if category.title
      cat.description = category.description if category.description
      cat.position = category.position if category.position

      cat.save

      updated_categories << cat
    end

    {
      categories: updated_categories,
      errors: []
    }
  end
end