require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

spy = Startup.new("Spy", "JJ", "w")
hoody = Startup.new("Hoody", "Tess", "t")
yell = Startup.new("Yell", "Rex", "p")

bill = VentureCapitalist.new("Bill", 500)
yves = VentureCapitalist.new("Yves", 700)
owen = VentureCapitalist.new("Owen", 4400500400)
hugh = VentureCapitalist.new("Hugh", 3000000000)
frank = VentureCapitalist.new("Frank", 5000000000)
titus = VentureCapitalist.new("Titus", 1500000500)

march = FundingRound.new(spy, bill, "hoot", 30)
april = FundingRound.new(hoody, yves, "hell", 20)
june = FundingRound.new(yell, owen, "tilt", 10)
july = FundingRound.new(spy, bill, "hoot", 70000)
august = FundingRound.new(yell, bill, "hoot", 80050)
september = FundingRound.new(yell, owen, "hoot", 3230)


binding.pry
potato
