class Level < ApplicationRecord
  default_scope { order(:position) }
end
