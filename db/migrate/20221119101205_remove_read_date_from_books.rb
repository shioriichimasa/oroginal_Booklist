class RemoveReadDateFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :read_date, :date
  end
end
