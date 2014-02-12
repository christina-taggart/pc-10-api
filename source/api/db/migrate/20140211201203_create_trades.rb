class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.belongs_to :market
      t.integer :transaction_id
      t.float :btc_price_per_coin
      t.float :quantity
      t.float :btc_total
      t.datetime :executed_at

      t.timestamps
    end
  end
end
