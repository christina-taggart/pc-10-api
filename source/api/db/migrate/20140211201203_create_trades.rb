class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.belongs_to :market
      t.string :transaction_id
      t.decimal :btc_price_per_coin
      t.decimal :quantity
      t.decimal :btc_total
      t.datetime :executed_at

      t.timestamps
    end
  end
end
