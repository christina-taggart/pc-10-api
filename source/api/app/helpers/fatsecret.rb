# Class to model the nutrition data of a food
class FoodNutrition
  attr_accessor :name, :calories, :fat, :carbs, :protein

  def initialize(args)
    @name = args[:name]
    @calories = args[:calories]
    @fat = args[:fat]
    @carbs = args[:carbs]
    @protein = args[:protein]
  end
end


# Class for retrieving and parsing nutrition data using the FatSecret API
class NutritionGetter
  def self.first_result(food)
    result = FatSecret.search_food(food)["foods"]["food"].first
    macros = self.parse_description(result["food_description"])
    food = FoodNutrition.new({
        name: result["food_name"],
        calories: macros[:calories],
        fat: macros[:fat],
        carbs: macros[:carbs],
        protein: macros[:protein]
      })
    food
  end

  def self.parse_description(description)
    macros = {}
    macros[:calories] = self.getCals(description)
    macros[:fat] = self.getFat(description)
    macros[:carbs] = self.getCarbs(description)
    macros[:protein] = self.getProtein(description)
    macros
  end

  def self.getCals(description)
    match = description.match(/Calories: (\d+)kcal/)
    match[1].to_i
  end

  def self.getFat(description)
    match = description.match(/Fat: (\d+.\d+)g/)
    match[1].to_f
  end

  def self.getCarbs(description)
    match = description.match(/Carbs: (\d+.\d+)g/)
    match[1].to_f
  end

   def self.getProtein(description)
    match = description.match(/Protein: (\d+.\d+)g/)
    match[1].to_f
  end
end