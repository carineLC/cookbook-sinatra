class View
  def display_recipes(recipes)
    puts "==========================="
    recipes.each_with_index do |recipe, index|
      recipe.done? ? status = "X" : status = " "
      puts " #{index + 1}. [#{status}] #{recipe.name} (#{recipe.prep_time}) #{recipe.difficulty}: #{recipe.description}"
    end
    puts "==========================="
  end

  def ask_user_for(what)
    puts "#{what}?"
    print ">"
    gets.chomp
  end

  def ask_user_for_id
    puts "Id?"
    print ">"
    gets.to_i - 1
  end

  def ask_user_for_keyword
    puts "What ingredient would you like a recipe for?"
    print ">"
    gets.chomp
  end

  def display_import_recipes(import_recipes)
    puts "==========================="
    import_recipes.each_with_index do |recipe, index|
      puts " #{index + 1} - #{recipe.name}"
    end
    puts "==========================="
  end
end
