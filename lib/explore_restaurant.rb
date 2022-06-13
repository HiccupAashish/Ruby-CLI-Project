class Restaurant
@@all=[]

attr_accessor :name, :time, :address, :website, :phonenumber, :url

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