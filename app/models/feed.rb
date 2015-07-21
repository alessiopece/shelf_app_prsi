class Feed < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :shelf

  validates :user_id, presence: true
  validates :category, presence: true

  default_scope -> { order(created_at: :desc) }
end
