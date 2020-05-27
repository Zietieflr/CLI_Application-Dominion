Card.destroy_all

CSV.foreach('./dominion_cards.csv', headers: true) do |row|
  Card.create(row.to_h)
end
