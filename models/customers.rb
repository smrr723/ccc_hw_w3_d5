require_relative('../db/sqlrunner')
require_relative('../models/films')

class Customer

end
# 1. Make all file requires, i.e. require_relative('pg') and other class files
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
#
