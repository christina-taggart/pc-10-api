class Market < ActiveRecord::Base
  has_many :trades
  validates :name, :description, uniqueness: true, presence: true
end
