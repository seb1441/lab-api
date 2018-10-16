class Types::LessonType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: true
  field :description, String, null: true
  field :category, Types::CategoryType, null: false
  field :level, Types::LevelType, null: false
  field :chapter, Types::ChapterType, null: false
end