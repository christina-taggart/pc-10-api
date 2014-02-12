class Trade < ActiveRecord::Base
  belongs_to :market
  validates :transaction_id, uniqueness: true
end
