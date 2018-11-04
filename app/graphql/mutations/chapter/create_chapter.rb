class Mutations::Chapter::CreateChapter < Mutations::BaseMutation
  null true

  field :chapter, Types::ChapterType, null: false
  field :errors, [String], null: false

  def resolve
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    position = (::Chapter.maximum(:position) || 0) + 1
    title = "Chapter #{position}"

    new_chapter = ::Chapter.create(title: title, position: position)
    {
      chapter: new_chapter,
      errors: []
    }
  end
end