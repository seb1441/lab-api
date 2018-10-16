class Category < ApplicationRecord
  default_scope { order(:position) }
end
