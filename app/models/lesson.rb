class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :level
  belongs_to :chapter

  default_scope { order(title: :asc) }
end
