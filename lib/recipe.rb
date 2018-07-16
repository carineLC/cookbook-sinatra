class Recipe
  attr_reader :name, :description, :prep_time, :difficulty
  attr_writer :done
  def initialize(name, description, prep_time, difficulty = "")
    @name = name
    @description = description
    @prep_time = prep_time
    @done = false
    @difficulty = difficulty
  end

  def done?
    @done
  end
end
