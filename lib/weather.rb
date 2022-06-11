class Weather 
@@all=[]
attr_accessor :city_name, :day, :temp

    def initialize
        self.class.all << self
    end

    def self.all
    @@all
    end

end