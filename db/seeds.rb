require_relative("../models/films")
require_relative("../models/customers")
require_relative("../models/tickets")

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => 'Satoshi Nakamoto', 'funds' => 100000})
customer1.save()
customer2 = Customer.new({'name' => 'Elon Musk', 'funds' => 1000000})
customer2.save()
customer3 = Customer.new({'name' => 'Sergey Brin', 'funds' => 1000000})
customer3.save()
customer4 = Customer.new({'name' => 'Nikola Tesla', 'funds' => 10})
customer4.save()
customer5 = Customer.new({'name' => 'Albert Einstein', 'funds' => 100})
customer5.save()

film1 = Film.new({'name' => 'Blade Runner 2049', 'price' => 20})
film1.save()
film2 = Film.new({'name' => 'Lost in Translation', 'price' => 10})
film2.save()
film3 = Film.new({'name' => 'Spirited Away', 'price' => 10})
film3.save()
film4 = Film.new({'name' => 'Shawshank Redemption', 'price' => 10})
film4.save()
film5 = Film.new({'name' => 'Akira', 'price' => 10})
film5.save()

binding.pry

nil











# require_relative( '../models/user' )
# require_relative( '../models/location' )
# require_relative( '../models/visit' )
#
# require( 'pry-byebug' )
#
# Visit.delete_all()
# Location.delete_all()
# User.delete_all()
#
# user1 = User.new({ 'name' => 'Samwise Gamgee' })
# user1.save()
# user2 = User.new({ 'name' => 'Gollum' })
# user2.save()
#
# location1 = Location.new({ 'category' => 'Attractions', 'name' => 'Mordor'})
# location1.save()
# location2 = Location.new({ 'category' => 'Places To Go', 'name' => 'Hobbiton'})
# location2.save()
#
# visit1 = Visit.new({ 'user_id' => user1.id, 'location_id' => location1.id, 'review' => '0 stars, far too hot'})
# visit1.save()
#
# visit2 = Visit.new({ 'user_id' => user2.id, 'location_id' => location1.id, 'review' => '5 stars, would visit again if I could'})
# visit2.save()
#
# visit3 = Visit.new({ 'user_id' => user1.id, 'location_id' =>
# location2.id, 'review' => '4 stars, plenty of beer available'})
# visit3.save()
#
# binding.pry
# nil
