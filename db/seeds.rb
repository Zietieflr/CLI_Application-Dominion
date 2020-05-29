Card.destroy_all
User.destroy_all
FavoriteCard.destroy_all
KingdomCardSet.destroy_all


CSV.foreach('./dominion_cards.csv', headers: true) do |row|
  Card.create(row.to_h)
end

# user => name
User.create(user_name: "Andrew")
User.create(user_name: "Logan")
User.create(user_name: "Matthew")
User.create(user_name: "Lynn")
User.create(user_name: "Zoe")
User.create(user_name: "Becky")
User.create(user_name: "Adrian")
User.create(user_name: "Beth")
User.create(user_name: "Rachelle")
User.create(user_name: "Bob")

andrew = User.first
logan = User.find_by(user_name: 'Logan')
# favorite card => user, card
FavoriteCard.create(user: andrew, card: Card.find(45))
FavoriteCard.create(user_id: andrew.id, card_id: Card.find(60).id)
FavoriteCard.create(user_id: andrew.id, card_id: Card.find(21).id)
FavoriteCard.create(user_id: andrew.id, card_id: Card.find(300).id)
FavoriteCard.create(user_id: andrew.id, card_id: Card.find(42).id)
FavoriteCard.create(user_id: logan.id, card_id: Card.find(30).id)
FavoriteCard.create(user_id: logan.id, card_id: Card.find(81).id)
FavoriteCard.create(user_id: logan.id, card_id: Card.find(101).id)
FavoriteCard.create(user_id: logan.id, card_id: Card.find(96).id)
FavoriteCard.create(user_id: logan.id, card_id: Card.find(378).id)

# Kingdom cards => name, user, card
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(55).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(21).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(320).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(186).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(76).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(297).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(19).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(202).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(411).id)
KingdomCardSet.create(name: 'Love it', user_id: andrew.id, card_id: Card.find(392).id)