class Mutations::Chapter::UpdateChapters < Mutations::BaseMutation
  class ChapterInput < Types::BaseInputObject
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :position, Integer, required: false
  end

  null true

  argument :chapters, [ChapterInput], required: true

  field :chapters, [Types::ChapterType], null: false
  field :errors, [String], null: false

  def resolve(chapters:)
    updated_chapters = []

    chapters.each do |chapter|
      next unless cat = ::Chapter.find_by(id: chapter.id)

      cat.title = chapter.title if chapter.title
      cat.description = chapter.description if chapter.description
      cat.position = chapter.position if chapter.position

      cat.save

      updated_chapters << cat
    end

    {
      chapters: updated_chapters,
      errors: []
    }
  end
end