require 'pry'
class Startup
    attr_reader :name, :founder, :domain
    @@all = []
    @@domains = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
        @@domains << domain
    end

    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        @@domains
    end

    def sign_contract(venture_capitalist, investment_type, investment_amt)
        new_funding_round = FundingRound.new(self, venture_capitalist, investment_type, investment_amt)
    end

    #helper method to just get a list of all the funding rounds for the particular startup instance
    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
    end

    def num_funding_rounds
        self.funding_rounds.length
    end

    def total_funds
        sum_funds = 0
        self.funding_rounds.each do |funding_round|
            sum_funds += funding_round.investment
        end
        sum_funds
    end

    def investors
        self.funding_rounds.collect do |funding_round|
            funding_round.venture_capitalist
        end.uniq
    end

    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end

end
