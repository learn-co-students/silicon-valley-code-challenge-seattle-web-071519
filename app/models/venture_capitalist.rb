class VentureCapitalist
    attr_accessor :name, :total_worth
    
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        club = []
        VentureCapitalist.all.select do |i|
            if i.total_worth > 1000000000
                club << i 
            end
        end

        club
    end

    def offer_contract(startup,venture_capitalist, type, amount)
        FundingRound.new(startup,self,type,amount)
    end

    def funding_rounds
        FundingRound.all.collect do |x|
            if x.venture_capitalist == self
                x
            end
        end

    end

    def portfolio
        FundingRound.all.collect do |x|
            if x.venture_capitalist == self
                x.startup
            end
        end

    end

    def biggest_investment
        # funding_rounds().sort
        # [-1]
        banana = []
        FundingRound.all.each do |funding_round|
            if funding_round.venture_capitalist == self
               banana << funding_round.investment
            end
        end
        banana = banana.sort 
        banana[-1]
    end

    def invested(domain)
        FundingRound.all.find do |x|
            if x.startup.domain = domain
                x.investment
                
            end
        end
    end

end
