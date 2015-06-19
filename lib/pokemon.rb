class Pokemon
  attr_accessor :id, :db

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    Pokemon.new.tap { |pokemon|
      pokemon.id = id
      pokemon.db = db
    }
  end

  def alter_hp(hp)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?
    SQL
    self.db.execute(sql, hp, self.id)
  end
end
