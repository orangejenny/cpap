class ChangeDaysAvg7indexToFloat < ActiveRecord::Migration
  def self.up
		change_table :days do |t|
			t.change :avg7index, :float
		end
  end

  def self.down
		change_table :days do |t|
			t.change :avg7index, :integer
		end
  end
end
