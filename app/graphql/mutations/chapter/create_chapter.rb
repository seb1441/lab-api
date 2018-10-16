class Mutations::Chapter::CreateChapter < Mutations::BaseMutation
  null true

  field :chapter, Types::ChapterType, null: false
  field :errors, [String], null: false

  def resolve
    title = "Chapter #{::Chapter.count + 1}"
    position = (::Chapter.maximum(:position) || 0) + 1

    new_chapter = ::Chapter.create(title: title, position: position)
    {
      chapter: new_chapter,
      errors: []
    }
  end
end