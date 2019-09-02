class Task < ApplicationRecord
  belongs_to :list
  def self.create_task(p, id)
    Task.find_by_sql(["
      INSERT INTO tasks (name, description, list_id, created_at, updated_at)
      VALUES (:name, :desctription, :list_id, :created_at, :updated_at);
    ", {
      name: p[:name],
      description: p[:description],
      list_id: id,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }])
  end
  
  def self.update_task(task_id, p)
    Task.find_by_sql(["
      UPDATE tasks AS t
      SET name = ?, description = ?, updated_at = ?
      WHERE t.id = ?
    ;", p[:name], p[:description], DateTime.now, task_id])
  end
  
  def self.delete_task(task_id)
    Task.find_by_sql(["
      DELETE FROM tasks AS t
      WHERE t.id = ?
    ;", task_id])
  end
end
