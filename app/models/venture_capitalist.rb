require 'pry' 

class VentureCapitalist
    #Is what a startup has through funding  rounds 
    
    attr_reader :name 
    attr_accessor :total_worth 

    @@all = []

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth

        @@name = []
        @@all << self 
    end 

def self.all
    @@all 
end 

binding.pry

#returns a **string** that is the venture capitalist's name


#returns an array of all venture capitalists in the Trés Commas club 
#(they have more then 1,000,000,000 `total_worth`)
def self.tres_commas_club
    self.all.select do |venture|
        venture.total_worth > 1000000000
    end 
end 

#given a **startup object**, type of investment (as a string), and the 
#amount invested (as a float), 
#creates a new funding round and (=)
#associates it with that startup and venture capitalist.
def offer_contract(startup, invested_amt, investment_type)
    new_funding_round = FundingRound.new(startup, self, investment_type, invested_amt) 
end 


#returns an array of all funding rounds for that venture capitalist
def funding_rounds
    FundingRound.all.select do |funding_round|
        funding_round.ventrure_capitalist == self
    end
end 


# Returns a **unique** list of all startups this venture capitalist has funded
def porfolio
    self.funding_rounds.collect do |funding_round|
        funding.round.startup
    end.uniq
end 


#returns the largest funding round given by this venture capitalist
def biggest_investment
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

end 

#given a **domain string**, returns the total amount invested in that domain
def invested(domain_string)
    total_invested = 0
    self.funding_rounds.each do |funding_round|
        if funding_round.startup.domain == domain_string
            total_invested += funding_round.investment  
        end 
    end 
            return total_invested
    end
end 
