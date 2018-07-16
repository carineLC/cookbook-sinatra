require_relative 'recipe'
require_relative 'view'
require 'open-uri'
require 'nokogiri'
require_relative 'scrap_marmiton_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end

  def create
    name = @view.ask_user_for("Name")
    description = @view.ask_user_for("Description")
    prep_time = @view.ask_user_for("Prep time")
    difficulty = @view.ask_user_for("Difficulty")
    recipe = Recipe.new(name, description, prep_time, difficulty)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    recipe_index = @view.ask_user_for_id
    @cookbook.remove_recipe(recipe_index)
  end

  def import
    keyword = @view.ask_user_for_keyword
    scrape_marmiton_service = ScrapeMarmitonService.new(keyword)
    array_recipe = scrape_marmiton_service.call
    @view.display_import_recipes(array_recipe)
    import_recipe_index = @view.ask_user_for_id
    import_recipe = array_recipe[import_recipe_index]
    @cookbook.add_recipe(import_recipe)
  end

  def mark
    recipe_index = @view.ask_user_for_id
    @cookbook.done_recipe(recipe_index)
  end
end
