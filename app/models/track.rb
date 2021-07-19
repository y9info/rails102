class Track < ApplicationRecord
  belongs_to :customer
  belongs_to :user, required: false
  default_scope -> { order(date: :desc) }
end
