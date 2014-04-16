class AddAvg7indexToDays < ActiveRecord::Migration
  def self.up
		rename_column :days, :avg7, :avg7hours
		add_column :days, :avg7index, :integer
  end

  def self.down
		rename_column :days, :avg7hours, :avg7
		remove_column :days, :avg7index
  end
end
