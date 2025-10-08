class Tag < ApplicationRecord
  has_many :gossip_tags
  has_many :gossips, through: :gossip_tags
end
class GossipTag < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag
end