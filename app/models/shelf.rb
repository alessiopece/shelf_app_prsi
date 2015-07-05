class Shelf < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  has_many :books, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :films, dependent: :destroy
end
