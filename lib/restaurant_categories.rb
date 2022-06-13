class Restaurant_categories

    attr_accessor :title, :url, :restaurants
@@all=[]


    def initialize()
        @@all << self
    end

    def self.all
    @@all
    end

    def self.reset_all
        @@all.clear
     end
end