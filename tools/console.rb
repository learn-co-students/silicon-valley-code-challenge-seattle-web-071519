require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#the parameters in the initialized method of the Starup class reffers to three object. 
#(name, founder, domain) Therefore three objects must be passed when called
startup_one = Startup.new("Hey there", "test" "this once")
startup_two = Startup.new("Now test", "this", "for twice")
startup_three = Startup.new("Final", "test", "sweep")

#the parameters in the initialized method of the Venture Capitalist class reffers to two objects. 
#(name, and total_worth - $$) Therefore two objects must be passed when called
venture_capitalist_one =  VentureCapitalist.new("Marisa", 100)
venture_capitalist_two =  VentureCapitalist.new("Second", 200)
venture_capitalist_three =  VentureCapitalist.new("Third", 300)

##the parameters in the initialized method of the Starup class reffers to four object. 
#(startup, venture capitalist, type, investment) Therefore four objects must be passed when called
funding_round_one = FundingRound.new(startup_one, venture_capitalist_two, "Example one", 400)
funding_round_two = FundingRound.new(startup_two, venture_capitalist_one, "Example two", 500)
funding_round_three = FundingRound.new(startup_three, startup_three, "Example three", 600)





binding.pry
0 #leave this here to ensure binding.pry isn't the last line