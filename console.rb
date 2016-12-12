require_relative( 'film' )
require_relative( 'customer' )
require_relative( 'ticket' )


require('pry')

customer1 = Customer.new({
  'name' => 'Amy',
  'funds' => 15
  })

customer1.save 

customer2 = Customer.new({
  'name' => 'Angela',
  'funds' => 20
  })

customer2.save

film1 = Film.new({
  'title' => 'Mr Nobody',
  'price' => 6
  })

film1.save

film2 = Film.new({
'title' => 'From Dusk Till Dawn',
'price' => 5
})

film2.save

ticket1 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer1.id
  })

ticket1.save

ticket2 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer2.id
  })

ticket2.save



binding.pry

nil
