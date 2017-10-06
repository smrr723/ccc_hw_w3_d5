require_relative("../db/sqlrunner")
require_relative("../models/customers")

class Film

  attr_accessor :name, :price
  attr_reader :id 

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @price = options['price'].to_i
end

def save()
  sql = "INSERT INTO films (name, price) VALUES ($1, $2)
  RETURNING id;"
  values = [@name, @price]
  film = SqlRunner.run(sql, values).first
  @id = film['id'].to_i
end

def self.view_all()
  sql = "SELECT * FROM films"
  values = []
  films = SqlRunner.run(sql, values)
  result = films.map {|film| Film.new( film )}
  return result
end

def self.delete_all()
  sql = "DELETE FROM films"
  values = []
  SqlRunner.run(sql, values)
end

def update()
  sql = "UPDATE films SET (name, price) VALUES ($1, $2) WHERE id = $3"
  values = [@name, @price, @id]
  SqlRunner.run(sql, values)
end

end
