require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
runescape = Startup.new("Runescape", "Katana", "www.stan.com")
asd = Startup.new("x","u","z")
wer = Startup.new("q","r","e")
bezos = VentureCapitalist.new("Jeff", 150000000000)
gates = VentureCapitalist.new("Bill", 70000000000)
katana = VentureCapitalist.new("Tran", 2)
puts "signing runescape contract with bezos" 
runescape.sign_contract(bezos,"donations",12210)
runescape.sign_contract(gates,"donations",122110)
asd.sign_contract(bezos,"donations",1220)
#bezos.offer_contract(wer,"donations",19101)


binding.pry

0 #leave this here to ensure binding.pry isn't the last line