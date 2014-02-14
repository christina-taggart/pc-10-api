require 'spec_helper'

describe 'Trade, an Active Record backed model' do
  describe 'A Trade object retrieved from the database' do
    it "should have a transaction id" do
      Trade.last.transaction_id.should be_a(Integer)
    end
  end
end