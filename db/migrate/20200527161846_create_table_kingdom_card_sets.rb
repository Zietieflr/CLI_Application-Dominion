class CreateTableKingdomCardSets < ActiveRecord::Migration[6.0]
  def change
    create_table :kingdom_card_sets do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :card, foreign_key: true
    end
  end
end
