class ScrapeMarmitonService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    array_recipe = []
    html_doc_recipe_list = scrap_content("https://www.marmiton.org/recettes/recherche.aspx?aqt=#{@keyword}")
    html_doc_recipe_list.search('.recipe-card')[0..4].each do |element|
      name = element.search('.recipe-card__title').text.strip
      description = element.search('.recipe-card__description').text.strip
      prep_time = element.search('.recipe-card__duration__value').text.strip
      link = element.attribute('href').value
      html_doc_recipe_info = scrap_content("https://www.marmiton.org" + link)
      difficulty = html_doc_recipe_info.search('.recipe-infos__level').text.strip
      array_recipe << Recipe.new(name, description, prep_time, difficulty)
    end
    array_recipe
  end

  private

  def scrap_content(url)
    Nokogiri::HTML(open(url).read, nil, 'utf-8')
  end
end
