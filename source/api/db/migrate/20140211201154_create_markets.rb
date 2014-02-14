class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.string :description
      t.integer :cryptsy_market_id
      t.text :latest_market_data

      t.timestamps
    end
  end
end
