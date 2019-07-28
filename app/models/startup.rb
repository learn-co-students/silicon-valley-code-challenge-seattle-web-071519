    #reader cannot be changed, only read
    #accessor can be changed and read 
require 'pry'

class Startup
    #has many venture capitalists 

attr_reader :founder, :domain, :name

@@domains = []
@@all = []

def initialize(name, founder, domain)
    @founder = founder
    @domain = domain 
    @name = name 
    

    @@domains << domain
    @@all << self 
end 

#Returns the total number of funding rounds that the startup has gotten
def funding_rounds
    FundingRound.all.select do |funding_round|
        funding_round.startup ==  self
    end 
end 

#given a string of a **domain** and a string of a **name**, change the 
#domain and name of the startup. This is the only public method through which the domain can be changed.
def pivot(new_domain, new_name)
    @domain = new_domain
    @name = new_name 
end

#should return **all** of the startup instances
def self.all 
    @@all
end 

#given a string of a **founder's name**, 
#returns the **first startup** whose founder's name matches
def self.find_by_founder(founder_name)
    self.all.find do |startup|
        startup.founder == founder_name
end 

# should return an **array** of all of the different startup domains
def self.domain
    @@domain
end 

# binding.pry

#given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float),
#creates a new funding round and associates it with that startup and venture capitalist.
def sign_contract(venture_capitalist, investment, investment_amt)
    new_funding_round = FundingROund.new(self, venture_capitalist, investment, investment_amt )
end 
    
#Returns the total number of funding rounds that the startup has gotten
def num_funding_rounds
    self.funding_rounds.length 
end

#Returns the total sum of investments that the startup has gotten
def total_funds
    sum_funds = 0
    self.funding_rounds.each do |funding_round|
        sum_funds += funding_round.investment
    end 
    sum_funds
end 

    #Returns a **unique** array of all the venture capitalists that have 
    #invested in this company
   
    def investors
        self.funding_rounds.collect do |funding_round|
            funding_round.venture_capitalist
        end.uniq
    end 

    #Returns a **unique** array of all the venture capitalists that 
    #have invested in this company and are in the Trés Commas club
    
    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.include?
        end 
    end 

end 

end
