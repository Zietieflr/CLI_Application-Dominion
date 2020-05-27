class CreateTableKingdomCardSets < ActiveRecord::Migration[6.0]
  def change
    create_table :kingdom_card_sets do |t|
      t.string :name
      t.references :user_id, foreign_key: true
      t.references :card_id, foreign_key: true
    end
  end
end
