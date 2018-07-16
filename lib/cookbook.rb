require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    write_csv
  end

  def done_recipe(recipe_index)
    @recipes[recipe_index].done = true
    write_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      new_recipe = Recipe.new(row[0], row[1], row[2], row[4])
      new_recipe.done = row[3] == 'true'
      @recipes << new_recipe
    end
  end

  def write_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?, recipe.difficulty]
      end
    end
  end
end
