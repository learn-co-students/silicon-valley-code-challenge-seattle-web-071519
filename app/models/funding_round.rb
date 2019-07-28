require 'pry'

class FundingRound
    #has many ventrure capitalists 

    attr_writer :startup, :ventrure_capitalist
    attr_accessor :type, :investment

    @@all = []

    def initialize(startup, ventrure_capitalist, type, investment)
        @startup = startup
        @ventrure_capitalist = ventrure_capitalist
        @type = type
        @investment = investment

        @@all << self 
    end 


    def self.all 
        @@all 
    end 

#     binding.pry 
# 0

end
