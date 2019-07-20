class Startup
    attr_accessor :name
    @@all = []

    def initialize(name, founder, domain)
        @name = name.to_s
        @founder = founder
        @domain = domain
        @@all << self
    end

    def to_s
        @name
    end

    def founder
        @founder.to_s
    end

    def domain
        @domain.to_s
    end

    def pivot(name_str, domain)
        @domain = domain
        @name = name_str
    end

    def Startup.all
        @@all
    end

    def Startup.find_by_founder(founder_name)
        @@all.find {|startup| founder = founder_name}
    end

    def Startup.domains 
        @@all.collect do |startup|
            @domain
        end
    end

    def sign_contract(vc, type, amount)
        #given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
        fr = FundingRound.new(self, type, amount, vc)
    end

    def funding_rounds
        #returns an array of all the funding rounds for this startup
        FundingRound.find_by_startup(self)
    end

    def num_funding_rounds
        #Returns the total number of funding rounds that the startup has gotten
        funding_rounds.length
    end

    def total_funds
        #Returns the total sum of investments that the startup has gotten
        total = 0
        funding_rounds.each do |fr|
            total += fr.investment
        end
        total
    end

    def investors
        #Returns a unique array of all the venture capitalists that have invested in this company
        vc_array = []
        self.funding_rounds.each do |fr|
            vc_array << fr.venture_capitalist unless vc_array.include?(fr.venture_capitalist)
        end
        vc_array
    end

    def big_investors
        #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
        all_investors = self.investors
        big_list = VentureCapitalist.tres_commas_club.each do |vc|
            big_list << self if all_investors.include?(self) && !big_list.include?(self)
        end
    end

end
