class Chapter < ApplicationRecord
  default_scope { order(:position) }
end
