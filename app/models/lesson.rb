class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :level
  belongs_to :chapter

  default_scope { includes(:chapter, :level, :category).order("categories.position").order("levels.position").order("chapters.position").order(:title) }
end
