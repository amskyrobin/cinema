require_relative( 'db/sql_runner')

class Film 

attr_accessor :title, :price
attr_reader :id

  def initialize(options)

    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i

  end

  def save()
    sql = "
    INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING *;
    "
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.all
    sql = "SELECT * from films;"
    return Film.get_many(sql)
  end

  def self.get_many(sql)
    films = SqlRunner.run(sql)
    films_objects = films.map { |film| Film.new(film) }
    return films_objects
  end

  def delete 
    sql = "DELETE FROM films where id = #{@id};"
    films = SqlRunner.run(sql)
  end

  def self.delete_all() 
    sql = "DELETE FROM films"
    films = SqlRunner.run(sql)
  end 

  def update(options)
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id};"
    customers = SqlRunner.run(sql)
  end


def customers()
  sql = "SELECT customers.* FROM customers
  INNER JOIN tickets on tickets.customer_id = customers.id
  WHERE film_id = #{@id}"

  return Customer.get_many(sql)
end

end