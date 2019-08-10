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

    # def total_worth
        
    # end
    #eturns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth) #YES
    def self.tres_commas_club
        self.all.collect do |c|
           if c.total_worth > 1000000000  
            c
           end
        end.compact #gets rid of 'nil's that were occurring at outputted array
    end
    
    def offer_contract(startup_object, investment_type, invested_amount)
        FundingRound.new(startup_object, self, type, invested_amount)
    end

    def funding_rounds
        FundingRound.all.find_all do |f|
            f.venture_capitalist == self  
        end
    end

    def portfolio
        FundingRound.all.select do |s|
            if s.venture_capitalist == self
            s.startup.uniq
            end
        end
    end
    #returns the largest funding round given by this venture capitalist #YAS!
    #incorporate funding_rounds instance method
    def biggest_investment
        investment_arr = self.funding_rounds.collect do |f|
            f.investment
        end
        investment_arr.max_by do |i|
            i
        end
    end

    def invested(domain)
        FundingRound.all.map do |t|
            if t.venture_capitalist == self
                t.startup = Startup.name
            end
        end 
    end

end
