require_relative( 'db/sql_runner')

class Customer

attr_accessor :name, :funds
attr_reader :id

def initialize(options)

  @id = options['id'].to_i
  @name = options['name']
  @funds = options['funds'].to_i

end

  def save()
    sql = "
    INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *
    "
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def self.all
    sql = "SELECT * from customers;"
    return Customer.get_many(sql)
  end

  def self.get_many(sql)
    customers = SqlRunner.run(sql)
    customers_objects = customers.map { |customer| Customer.new(customer) }
    return customers_objects
  end

  def delete 
    sql = "DELETE FROM customers where id = #{@id};"
    customers = SqlRunner.run(sql)
  end

  def self.delete_all() 
    sql = "DELETE FROM customers"
    customers = SqlRunner.run(sql)
  end 

def update()
  sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id};"
  customers = SqlRunner.run(sql)
end


def films()
  sql = "SELECT films.* FROM films
        INNER JOIN tickets ON tickets.film_id = films.id
        WHERE customer_id = #{@id};"

        return Film.get_many(sql)
      end


def buy_ticket()
  sql = "UPDATE funds FROM customers 
          "

          customers = SqlRunner.run(sql)

end
end
