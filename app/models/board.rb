class Board < ApplicationRecord
  has_many :lists
  def self.all_boards
    Board.find_by_sql(
      "SELECT *
      FROM boards AS b"
    )
  end
  def self.create_board(p, id)
    Board.find_by_sql(["
      INSERT INTO boardss (name, created_at, updated_at)
      VALUES (:name, :created_at, :updated_at);
    ", {
      name: p[:name],
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end
  
  def self.update_board(id, p)
    Board.find_by_sql(["
      UPDATE boards AS b
      SET name = ?, updated_at = ?
      WHERE b.id = ?
    ;", p[:name], DateTime.now, id])
  end
  
  def self.delete_board(id)
    Board.find_by_sql(["
      DELETE FROM boards AS b
      WHERE b.id = ?
    ;", id])
  end
end
