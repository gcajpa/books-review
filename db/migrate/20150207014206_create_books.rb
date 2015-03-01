class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.datetime :completed_at
      t.text :review
      t.belongs_to :user, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :books, :users
  end
end
