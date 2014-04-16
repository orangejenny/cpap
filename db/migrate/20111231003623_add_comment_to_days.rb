class AddCommentToDays < ActiveRecord::Migration
  def self.up
    add_column :days, :comment, :string
  end

  def self.down
    remove_column :days, :comment
  end
end
