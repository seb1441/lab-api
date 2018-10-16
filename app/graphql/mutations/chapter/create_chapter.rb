class Mutations::Chapter::CreateChapter < Mutations::BaseMutation
  null true

  field :chapter, Types::ChapterType, null: false
  field :errors, [String], null: false

  def resolve
    position = (::Chapter.maximum(:position) || 0) + 1
    title = "Chapter #{number}"

    new_chapter = ::Chapter.create(title: title, position: position)
    {
      chapter: new_chapter,
      errors: []
    }
  end
end