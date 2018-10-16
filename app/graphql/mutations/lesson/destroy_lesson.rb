class Mutations::Lesson::DestroyLesson < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :lesson, Types::LessonType, null: true
  field :errors, [String], null: false

  def resolve(id:)
    errors = []

    lesson_destroyed = ::Lesson.find_by(id: id)

    if lesson_destroyed
      lesson_destroyed.destroy
    else
      errors.push "Lesson not found"
    end

    {
      lesson: lesson_destroyed,
      errors: errors
    }
  end
end