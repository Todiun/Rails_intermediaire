class Gossip < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :gossip_tags, dependent: :destroy
  has_many :tags, through: :gossip_tags
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

    # --- VALIDATIONS ---
  validates :title, presence: true, length: { minimum: 3, maximum: 25}
  validates :content, presence: true
end
