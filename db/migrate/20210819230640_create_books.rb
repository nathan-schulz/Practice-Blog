class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string  :title
      t.boolean :out_of_print
      t.integer :isbn
      t.date    :year_published
      t.text    :reviews

      t.timestamps
    end
  end
end
