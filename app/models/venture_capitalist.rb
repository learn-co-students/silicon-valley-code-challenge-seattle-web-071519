class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth
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
        self.all.select do |venture_person|
            venture_person.total_worth > 1000000000
        end
    end

    def offer_contract(startup, investment_type, investment_amt)
        new_funding_round = FundingRound.new(startup, self, investment_type, investment_amt)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio
        self.funding_rounds.collect do |funding_round|
            funding_round.startup
        end.uniq
    end

    def biggest_investment
        #just place holders to keep track of the biggest investment 
        #and which round that investment came from
        #for later: can I write this with reduce?
        big_investment = 0
        big_round = {}
        self.funding_rounds.each do |funding_round|
            if funding_round.investment > big_investment
                big_investment = funding_round.investment
                big_round = funding_round
            end
        end
        big_round
    end

    def invested(domain_string)
        total_invested = 0
        self.funding_rounds.each do |funding_round|
            if funding_round.startup.domain == domain_string
                total_invested += funding_round.investment
            end
        end
        total_invested
    end
end
