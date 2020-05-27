class CreateTableCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :card_name
      t.integer :set_number
      t.string :set_name
      t.string :type
      t.boolean :is_kingdom_card
      t.string :cost
      t.string :card_text
    end
  end
end
