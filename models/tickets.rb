require_relative("../db/sqlrunner")
require_relative("../models/films")
require_relative("../models/customers")


class Ticket

attr_reader :id, :customer_id, :film_id

def initialize( options )
  @id = options['id'].to_i if options['id']
  @customer_id = options['customer_id']
  @film_id = options['film_id']
end

def save()
  sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;"
  values = [@customer_id, @film_id]
  ticket = SqlRunner.run(sql, values).first
  @id = ticket['id'].to_i
end

def self.list_all()
  sql = "SELECT * FROM tickets"
  values = []
  tickets = SqlRunner.run(sql, values)
  result = tickets.map { |ticket| Ticket.new( ticket )}
  return result
end

def update()
  sql = "UPDATE tickets SET (customer_id, film_id) VALUES ($1, $2) WHERE id = $3"
  values = [@customer_id, @film_id, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM tickets"
  values = []
  SqlRunner.run(sql, values)
end

end
