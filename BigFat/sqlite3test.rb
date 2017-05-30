require 'sqlite3'

def inserir_fat db, n, v

  db.execute "INSERT INTO fat VALUES(#{n.to_s},#{v.to_s})"

end

def pegar_fat db, n
  return
end

def fat n
  return 1 if n == 0
  return n*fat(n-1)
end

begin

   db = SQLite3::Database.open "data.db"

   100.times do |n|
     puts n
     inserir_fat db, n, fat(n)
   end

rescue e

  puts e

end
