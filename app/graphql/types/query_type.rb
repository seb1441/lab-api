class Types::QueryType < Types::BaseObject
  class LessonFiltersInput < Types::BaseInputObject
    argument :category_id, ID, required: false
    argument :level_id, ID, required: false
    argument :chapter_id, ID, required: false
  end

  field :categories, [Types::CategoryType], null: true
  field :levels, [Types::LevelType], null: true
  field :chapters, [Types::ChapterType], null: true

  field :lessons, [Types::LessonType], null: true do
    argument :filters, LessonFiltersInput, required: false
  end
  field :lesson, Types::LessonType, null: true do
    argument :id, ID, required: true
  end

  def categories
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    Category.all
  end

  def levels
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    Level.all
  end

  def chapters
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    Chapter.all
  end

  def lesson(id:)
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    Lesson.find_by(id: id)
  end
  def lessons(filters: nil)
    raise GraphQL::ExecutionError, "Unauthorized" unless Utils::General.authorized_yuki(context[:current_user])

    if filters
      attrs = {}
      attrs[:category_id] = filters.category_id if filters.category_id
      attrs[:level_id] = filters.level_id if filters.level_id
      attrs[:chapter_id] = filters.chapter_id if filters.chapter_id

      Lesson.where(attrs)
    else
      Lesson.all
    end
  end
  
  field :current_user, Types::UserType, null: true
  def current_user
    context[:current_user]
  end
end
