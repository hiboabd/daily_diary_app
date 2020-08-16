require 'pg'

def persisted_data(id:)
  database_connection = PG.connect(dbname: 'diary_manager_test')
  result = database_connection.query("SELECT * FROM diary WHERE id = #{id};")
  p result.first
end
