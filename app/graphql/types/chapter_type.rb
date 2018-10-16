class Types::ChapterType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: true
  field :description, String, null: true
  field :position, Integer, null: false
end