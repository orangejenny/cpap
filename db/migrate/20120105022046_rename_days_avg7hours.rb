class RenameDaysAvg7hours < ActiveRecord::Migration
  def self.up
		rename_column :days, :avg7hours, :avg7time
  end

  def self.down
		rename_column :days, :avg7time, :avg7hours
  end
end
