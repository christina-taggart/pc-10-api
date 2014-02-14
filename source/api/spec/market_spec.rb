require 'spec_helper'

describe "Market, an Active Record backed model" do
  describe "A Market object retrieved from the DB" do
    it "should have a name" do
      Market.last.name.should be_a(String)
      Market.last.name.should_not be_empty
    end
    it "should have a description" do
      Market.last.name.should be_a(String)
      Market.last.name.should_not be_empty
    end
  end
end