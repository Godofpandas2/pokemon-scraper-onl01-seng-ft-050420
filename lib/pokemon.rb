require 'pry'
class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id:nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.new_from_db(row)
    binding.pry
    new_pokemon = self.new
    new_pokemon.id = row[0]
    new_pokemon.name = row[1]
    new_pokemon.type = row[2]
    new_pokemon
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
      db.execute(sql, id).map do |row|
        self.new_from_db(row)
      end
  end
end
