class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, foreign_key:"author_id"
  has_many :comments
  has_many :likes
end
