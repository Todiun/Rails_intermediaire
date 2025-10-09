class Gossip < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments
  has_many :likes

    # --- VALIDATIONS ---
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true
end
