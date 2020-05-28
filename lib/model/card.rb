class Card < ActiveRecord::Base
  has_many :favorite_cards
  has_many :kingdom_card_sets

  has_many :users, through: :favorite_cards
  has_many :users, through: :kingdom_card_sets
end