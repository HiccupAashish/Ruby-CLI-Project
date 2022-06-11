class Coffee 
  
attr_accessor :name, :price, :description
@@all=[]

    def initialize
        @@all << self
    end

    def self.all
    @@all
    end

end
