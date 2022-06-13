

class Scrapper
   Coffee_URL="https://camposcoffee.com/"
   Weather_URL="https://www.weatherzone.com.au/"
   Categories_URL="https://www.broadsheet.com.au/sydney"

    def get_page url
         Nokogiri::HTML(open(url)) 
    end
   

    def get_coffee
       self.get_page(Coffee_URL).css("div.product-card__content").each do |categories|
         coffee=Coffee.new
         coffee.name=categories.css(".product-card__content__title").text.strip
         a=categories.css("bdi").text.strip
         coffee.price=a.gsub("$","").to_f
         coffee.description=categories.css(".product-card__content__excerpt").text.strip
       end
    end
    
    def get_location_and_weather
      self.get_page(Weather_URL).css(".sc-jqMLrT").each do |forecast|
        weather=Weather.new
        weather.city_name=forecast.css("a").text
        weather.temp=forecast.css(".duPTti").text
        weather.day=forecast.css("title").text
      end
    end

  def get_restaurant_categories
      self.get_page(Categories_URL).css("div.col-xs-12.col-s-4.col-l-3").each do |data|
        restaurant=Restaurant_categories.new
        restaurant.title= data.css("div.teaser-title").text.strip
        restaurant.url=data.css("a").attr("href").value
      end
  end
  
  def get_selected_category category
    url=category.url
    page_url= url.include?(Categories_URL)? url:"https://www.broadsheet.com.au#{url}"
      self.get_page(page_url).css("div.col-m-6.col-xxs-12").collect do |categories|
        exploring=Restaurant.new
        a=categories.css("a h2").text.strip
        b=categories.css("a h5").text.strip
        exploring.name= a +" "+ b
        exploring.url=categories.css("a").attr("href").value
      end

  end
  
  def get_selected_description (restaurant)
    url=restaurant.url
    pass_url= url.include?(Categories_URL)? url:"https://www.broadsheet.com.au#{url}"
      self.get_page(pass_url).css("div.layout-section-with-ad").collect do |selected|
        restaurant.time =selected.css("div.venue-hours-time").text.strip
        restaurant.website=selected.css("div.website-layout a").text.strip
        restaurant.phonenumber=selected.css("div.telephone-block a").text.strip
        restaurant.address=selected.css("address a span").text
      end
  end

end

