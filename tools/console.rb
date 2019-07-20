require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#example venture capitalists
rich_bob = VentureCapitalist.new("Bob", 2000000000)
rich_jane = VentureCapitalist.new("Jane", 4000000000)
rich_joe = VentureCapitalist.new("Joe", 200000000)
mooching_molly = VentureCapitalist.new("Molly", 20000)

#example startups
other_idea = Startup.new("Other Idea the App", "Kenneth", "Dating")
big_idea = Startup.new("Big Idea the App", "Kenneth", "Creativity")
trucking = Startup.new("Truck Swipe", "Hal", "Transportation")

#example funding rounds
round1 = FundingRound.new(big_idea, "Series A", 400000, rich_bob)
round2 = FundingRound.new(big_idea, "Series B", 200000, rich_jane)
round3 = FundingRound.new(other_idea, "Angel", 30000, rich_joe)
round4 = FundingRound.new(other_idea, "Seed", 2000, rich_jane)
round5 = FundingRound.new(trucking, "Seed", -200, mooching_molly)
repeat_round = FundingRound.new(other_idea, "thingy", 7000000, rich_jane)

big_idea.sign_contract(mooching_molly, "seed", 400)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line