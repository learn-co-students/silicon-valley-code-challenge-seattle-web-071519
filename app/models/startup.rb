class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []
    @@domains = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << self.domain
    end

    def pivot(domain, string)
        @domain = domain
        @string = string
    end

    def self.all
        @@all
    end

    def self.find_by_founder(foundername)
        Startup.all.select do |i| 
            if i.founder ==  foundername
                i
            end
        end
    end

    def self.domains
        @@domains
    end

    def sign_contract(venture_capitalist,type,amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    def num_funding_rounds
        FundingRound.all.map do |rounds|
            if rounds.startup == self
                rounds
            end
        end.length
    end

    def total_funds
        x = 0
        FundingRound.all.each do |fundinground|
            if fundinground.startup == self
            x += fundinground.investment
            end
    
        end
        return x

    end
    
    def investors
        FundingRound.all.collect do |x|
        if x.startup == self
            x.venture_capitalist
        end
    end

    end

    def big_investors
        # sorted = investment array .sort 
        # return investment.max
        FundingRound.all.collect do |x|
            if x.startup == self
                if x.venture_capitalist.total_worth > 1000000000
                    x.venture_capitalist
                end
            end
        end
    end

    
      
    



end
