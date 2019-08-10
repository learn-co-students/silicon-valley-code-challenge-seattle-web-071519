class Startup

    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end 

    def pivot(domain, name) #YES
        newdomain = Startup.new(self, founder, domain)
    end

    def self.find_by_founder(founder_name) #YES
        self.all.find do |f|
            f.founder == founder_name
            # f.founder
        end
    end

    def self.domains #YES
        self.all.collect do |d|
            d.domain 
        end
    end
    #YES
    def sign_contract(venture_capitalist, type, investment)
       FundingRound.new(self, venture_capitalist, type, investment)
    end

    #Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds #YES
        FundingRound.all.select do |f|
            f.startup == self
        end.length
    end
    #Returns the total sum of investments that the startup has gotten
    def total_funds #YES
        startup_arr = FundingRound.all.select do |f|
            f.startup == self
        end
        startup_arr.collect do |s|
            s.investment
        end.sum  
    end
    #Returns a unique array of all the venture capitalists that have invested in this company
    def investors #YAS
        arr = FundingRound.all.select do |f|
            f.startup == self
            # binding.pry
        end
        arr.collect do |f|
            f.venture_capitalist.name
        end.uniq
    end

    #unique array of all the venture capitalists that have invested in 
    #this company and are in the Trés Commas club
    #use investors method && VentureCapitalist.tres_commas_club
    def big_investors
        arr = VentureCapitalist.tres_commas_club.collect do |v|
            v.name
        end #YASS!
        arr & self.investors
    end
    

end

