class Mutations::Chapter::DestroyChapter < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :chapter, Types::ChapterType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    errors = []

    chapter_destroyed = ::Chapter.find_by(id: id)

    if chapter_destroyed
      chapter_destroyed.destroy
    else
      errors.push "Chapter not found"
    end

    {
      chapter: chapter_destroyed,
      errors: errors
    }
  end
end