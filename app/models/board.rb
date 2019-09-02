class Board < ApplicationRecord
  has_many :lists
  validates :name, presence: true
  def self.all_boards
    Board.find_by_sql(
      "SELECT *
      FROM boards AS b"
    )
  end
  def self.create_board(p)
    Board.find_by_sql(["
      INSERT INTO boards (name, created_at, updated_at)
      VALUES (:name, :created_at, :updated_at);
    ", {
      name: p[:name],
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end
  
  def self.update_board(p, board_id)
    Board.find_by_sql(["
      UPDATE boards AS b
      SET name = ?, updated_at = ?
      WHERE b.id = ?
    ;", p[:name], DateTime.now, board_id])
  end
  
  def self.delete_board(id)
    Board.find_by_sql(["
      DELETE FROM boards AS b
    ;"])
  end
end
