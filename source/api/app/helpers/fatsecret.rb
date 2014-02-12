class NutritionGetter
  def self.first_result(food)
    result = FatSecret.search_food(food)
    result["foods"]["food"].first
  end
end