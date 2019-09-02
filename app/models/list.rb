class List < ApplicationRecord
  belongs_to :board
  has_many :tasks
  validates :name, :priority, presence: true
  validates :priority, inclusion: { in: %w(high medium low),
    message: "%priority must be high, medium, or low" }
  def self.create_list(p, id)
    List.find_by_sql(["
      INSERT INTO lists (name, priority, board_id, created_at, updated_at)
      VALUES (:name, :priority, :board_id, :created_at, :updated_at);
    ", {
      name: p[:name],
      priority: p[:priority],
      board_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end
  
  def self.update_list(list_id, p)
    List.find_by_sql(["
      UPDATE lists AS l
      SET name = ?, priority = ?, updated_at = ?
      WHERE l.id = ?
    ;", p[:name], p[:priority], DateTime.now, list_id])
  end
  
  def self.delete_list(list_id)
    List.find_by_sql(["
      DELETE FROM lists AS l
      WHERE l.id = ?
    ;", list_id])
  end
end
