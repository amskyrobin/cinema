require_relative( 'db/sql_runner')

class Ticket

attr_reader :film_id, :customer_id, :id
  
  def initialize(options)

    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i

  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
           VALUES (#{ @customer_id }, #{ @film_id }) RETURNING *;"
    ticket = SqlRunner.run( sql ).first
    @id = ticket['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tickets;"
    return Ticket.get_many(sql)
  end

  def self.get_many(sql)
    tickets = SqlRunner.run(sql)
    tickets_objects = tickets.map { |ticket| Ticket.new(ticket) }
    return tickets_objects
  end

def delete 
  sql = "DELETE FROM tickets where id = #{@id};"
  tickets = SqlRunner.run(sql)
end

def self.delete_all() 
  sql = "DELETE FROM tickets"
  tickets = SqlRunner.run(sql)
end 


def update()
  sql = "UPDATE tickets SET (customer_id, film_id) = (#{@customer_id}, #{@film_id}) WHERE id = #{@id};"
  customers = SqlRunner.run(sql)
end

end