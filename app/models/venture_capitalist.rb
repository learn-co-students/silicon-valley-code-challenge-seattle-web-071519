class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
        @name = name.to_s
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        #returns an array of all venture capitalists in the Trés Commas club 
        self.all.select do |vc|
            vc.total_worth if vc.total_worth > 1000000000
        end
    end    

    def offer_contract(startup, investment_type, amount)
        fr = FundingRound.new(startup, investment_type, 300000, self)
    end

    def funding_rounds
        FundingRound.find_by_vc(self)
    end

    
    def portfolio
        #Returns a unique list of all startups this venture capitalist has funded
        portfolio_array = []
        self.funding_rounds.each do |fr|
            portfolio_array << fr.startup unless portfolio_array.include? fr.startup
        end
        portfolio_array
    end

    #returns the largest funding round given by this venture capitalist
    def biggest_investment
        largest = funding_rounds[0]
        funding_rounds.each do |fr|
            if fr.investment > largest.investment
                largest = fr
            end
        end
        largest
    end

    def invested(domain_name)
        #given a domain string, returns the total amount invested in that domain
        total_investments = 0
        funding_rounds.each do |fr|
            total_investments += fr.investment if fr.startup.domain == domain_name
        end
        total_investments
    end

end
