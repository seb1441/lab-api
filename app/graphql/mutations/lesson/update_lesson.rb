class Mutations::Lesson::UpdateLesson < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :category_id, ID, required: true
  argument :level_id, ID, required: true
  argument :chapter_id, ID, required: true
  argument :title, String, required: false
  argument :description, String, required: false

  field :lesson, Types::LessonType, null: false
  field :errors, [String], null: false

  def resolve(id:, category_id:, level_id:, chapter_id:, title: nil, description: nil)
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    lesson = ::Lesson.find_by(id: id)
    errors = []

    if lesson
      lesson.category_id = category_id
      lesson.level_id = level_id
      lesson.chapter_id = chapter_id

      lesson.title = title if title
      lesson.description = description if title

      lesson.save
    else
      errors.push['Lesson not found']
    end

    {
      lesson: lesson,
      errors: errors
    }
  end
end