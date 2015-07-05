class Item < ActiveRecord::Base
  belongs_to :shelf
  default_scope -> { order(created_at: :desc) }
  validates :shelf_id, presence: true
end
