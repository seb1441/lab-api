class Mutations::Lesson::CreateLesson < Mutations::BaseMutation
  null true

  field :lesson, Types::LessonType, null: false
  field :errors, [String], null: false

  def resolve
    title = "Lesson #{::Lesson.count + 1}"

    new_lesson = ::Lesson.create(title: title, category: ::Category.first, level: ::Level.first, chapter: ::Chapter.first)
    {
      lesson: new_lesson,
      errors: []
    }
  end
end