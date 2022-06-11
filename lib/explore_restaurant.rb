class Restaurant
@@all=[]

attr_accessor :restaurant, :time, :location, :website, :phonenumber,:title,:url

    def initialize 
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.reset_all
        @@all.clear
     end

end