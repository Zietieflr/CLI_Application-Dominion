class User < ActiveRecord::Base
  has_many :favorite_cards
  has_many :kingdom_card_sets

  has_many :cards, through: :favorite_cards
  has_many :cards, through: :kingdom_card_sets
end
