class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :content
      t.integer :status, default: 0, null: false
      t.datetime :due_date
      t.datetime :start_at
      t.datetime :end_at
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
