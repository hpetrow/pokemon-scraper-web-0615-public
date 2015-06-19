require 'Nokogiri'

class Scraper
  def initialize(db)
    @db = db
    html = File.read('pokemon_index.html')
    @pokemon_doc = Nokogiri::HTML(html)
  end

  def scrape
    @pokemon_doc.css('.infocard-tall').each {|infocard|
      name = infocard.css('.ent-name').text
      type = infocard.css('.aside a:first-child').text
      Pokemon.save(name, type, @db)
    }
  end
end
