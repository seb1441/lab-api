class Mutations::Lesson::CreateLesson < Mutations::BaseMutation
  null true

  field :lesson, Types::LessonType, null: false
  field :errors, [String], null: false

  def resolve
    position = (::Level.maximum(:position) || 0) + 1
    title = "Lesson #{number}"

    new_lesson = ::Lesson.create(title: title, category: ::Category.first, level: ::Level.first, chapter: ::Chapter.first)
    {
      lesson: new_lesson,
      errors: []
    }
  end
end