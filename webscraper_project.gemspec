Gem::Specification.new do |s|
    s.name        = 'web-scraper'
    s.version     = '0.0.0'
    s.summary     = "Morning Tasker project"
    s.description = "A scraping project made to perform morning taks."
    s.authors     = ["Aashish shah"]
    s.email       = 'shahaashish22@gmail.com'
    s.files       = [
        "lib/cli.rb",
        "lib/coffee.rb",
        "lib/weather.rb",
        "lib/explore_restaurant.rb", 
        "lib/restaurant_categories.rb",
        "lib/scrapping.rb",
        "config/environment.rb"
    ]
    s.homepage    =
      'https://rubygems.org/gems/hola'
    s.license       = 'MIT'
    s.executables << "web_scraping"
  end