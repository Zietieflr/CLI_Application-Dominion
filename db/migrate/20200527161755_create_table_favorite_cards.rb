class CreateTableFavoriteCards < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_cards do |t|
      t.references :user_id, foreign_key: true
      t.references :card_id, foreign_key: true
    end
  end
end
