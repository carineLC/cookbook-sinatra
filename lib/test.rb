require_relative 'controller'
require_relative 'cookbook'
require_relative 'recipe'
require_relative 'view'
require 'open-uri'
require 'nokogiri'


new_recipe = Recipe.new("name", "description", "prep_time", "difficulty")
p new_recipe

new_recipe2 = Recipe.new("name", "description", "prep_time")
p new_recipe2
