Card.destroy_all

CSV.foreach('./dominion_cards.csv', headers: true) do |row|
  # binding.pry
  Card.create(row.to_h)
  # binding.pry
end
