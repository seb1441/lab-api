class Mutations::Lesson::CreateLesson < Mutations::BaseMutation
  null true

  field :lesson, Types::LessonType, null: false
  field :errors, [String], null: false

  def resolve
    position = (::Lesson.maximum(:position) || 0) + 1
    title = "Lesson #{position}"

    ::Category.create(title: 'Category 1', position: 1) if ::Category.count == 0
    ::Level.create(title: 'Level 1', position: 1) if ::Level.count == 0
    ::Chapter.create(title: 'Chapter 1', position: 1) if ::Chapter.count == 0

    new_lesson = ::Lesson.create(title: title, category: ::Category.first, level: ::Level.first, chapter: ::Chapter.first)
    {
      lesson: new_lesson,
      errors: []
    }
  end
end