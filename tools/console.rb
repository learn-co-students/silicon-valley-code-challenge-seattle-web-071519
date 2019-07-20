require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup_one = Startup.new("Test Company", "James Joe", "beepboop")
startup_two = Startup.new("Hey Whoa", "Cythia Abs", "asdklfjdk")
startup_three = Startup.new("Sup Co.", "Blah blah", "test test test")
Startup.find_by_founder("Cythia Abs")

venture_capitalist_one = VentureCapitalist.new("Fluffy", 2000000000)
venture_capitalist_two = VentureCapitalist.new("Grapes", 50)
venture_capitalist_three = VentureCapitalist.new("How is this", 1000100100100)
VentureCapitalist.tres_commas_club

funding_round_one = FundingRound.new(startup_one, venture_capitalist_two, "Angel", 50)
funding_round_two = FundingRound.new(startup_two, venture_capitalist_one, "Pre-Seed", 30000)
funding_round_three = FundingRound.new(startup_one, venture_capitalist_three, "Seed", 50000)
funding_round_four = FundingRound.new(startup_three, venture_capitalist_one, "Series A", 1211150)
funding_round_four = FundingRound.new(startup_three, venture_capitalist_one, "Series A", 1211150)



startup_one.sign_contract(venture_capitalist_one, "Pre-Seed", 1000)
venture_capitalist_two.invested("beepboop")
venture_capitalist_one.biggest_investment
venture_capitalist_three.portfolio



binding.pry
0 #leave this here to ensure binding.pry isn't the last line