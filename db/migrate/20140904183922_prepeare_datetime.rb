class PrepeareDatetime < ActiveRecord::Migration
  def change
  	remove_column :tasks, :deadline, :datatime
    add_column :tasks, :deadline, :datetime
  end
end
