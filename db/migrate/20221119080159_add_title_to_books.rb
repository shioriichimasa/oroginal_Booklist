class AddTitleToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :author, :string
    add_column :books, :review, :string
    add_column :books, :read_date, :date
  end
end
