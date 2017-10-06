require_relative('../db/sqlrunner')
require_relative('../models/films')

class Customer

attr_accessor :name, :funds
attr_reader :id

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @funds = options['funds'].to_i
end

def save()
  sql = "INSERT INTO customers (name, funds)
  VALUES ($1, $2)
  RETURNING id;"
  values = [@name, @funds]
  customer = SqlRunner.run(sql, values).first
  @id = customer['id'].to_i
end

def self.view_all()
  sql = "SELECT * FROM customers"
  values = []
  customers = SqlRunner.run( sql, values )
  result = customers.map {|customer| Customer.new( customer )}
  return result
end

def update()
  sql = "UPDATE customers SET (name, funds) VALUES ($1, $2) WHERE id = $3;"
  values = [@name, @funds, @id]
  SqlRunner.run(sql, values)
end


def self.delete_all()
  sql = "DELETE FROM customers"
  values = []
  SqlRunner.run(sql, values)
end


end
#
# ---- Creating Classes ----

# 1. Make all file requires, i.e. require_relative('pg') and other class file dependents
#
# 2. Create class
#
# 3. def initialize(options) with @instance variables referring to each column in that table
#
# 4. attr_accessor/reader for all instance variables so you can edit or access them.  Remember what the attr_accessor function actually replaces - just short hand.
#
# 5. def functions for CRUD (save, read all, delete, delete all).  Remember which options are on the whole class, i.e. self - a single class instance shouldn't be able to call delete_all for example.
#
# 6. In your CRUD functions, you need to:
# - set sql = "INSERT INTO.." blah blah
# - set values = []
# - reference the SqlRunner file which is there to refactor code and follow DRY methodology.  Opens the connection to the db, runs db.prepare and exec, and closes the db.
#
# 7. Remember to get the id from the DB, returning a string, so have to convert it to an integer.  This sets your instance variable @id in your ruby class file, so you can access it easily.
#
# 8. Note: prepared statements defend against sql injection.
# #
# ---- Creating the Database ----
#
# 1. in terminal "createdb database_name"
# 2. in terminal "touch db/database_name.sql"
# 3. Create your tables in your database as follows:-
#
# - CREATE TABLE table_name (values)
# - id should always be first, and followed by SERIAL4/8 PRIMARY KEY
# - if creating a join table with reference values from two others, use the REFERENCES command, and always follow with ON DELETE CASCADE to delete values in this table if the referenced entry (parent) is deleted.
#
# 4. in your runner file, ensure if you have data entry, always use the PG::Connection.escape_string command, which will protect against sql injection.
