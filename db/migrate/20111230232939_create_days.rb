class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.date :day
      t.decimal :avg7

      t.timestamps
    end
  end

  def self.down
    drop_table :days
  end
end
