class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false, index: { unique: true }
      t.text :description
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
