class FundingRound
    attr_reader :startup, :type, :venture_capitalist, :investment
    @@all = []
    def initialize(startup, type, investment, vc) #investment here is an amount
        @startup = startup
        @type = type
        investment < 0 ? @investment = 0 : @investment = investment.to_f
        @venture_capitalist = vc
        @@all << self
    end

    def self.all
        @@all
    end


   
    def self.find_by_startup(relevant_startup)
         #returns an array of all funding rounds for the provided startup
        @@all.select do |fr|
            fr.startup == relevant_startup

        end
    end

    #returns an array of all funding rounds that have the provided venture capitalist
    def self.find_by_vc(vc)
        @@all.select do |fr|
            fr.venture_capitalist == vc
        end
    end

end
