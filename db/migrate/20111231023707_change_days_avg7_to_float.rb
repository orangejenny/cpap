class ChangeDaysAvg7ToFloat < ActiveRecord::Migration
  def self.up
		change_table :days do |t|
			t.change :avg7, :float
		end
  end

  def self.down
		change_table :days do |t|
			t.change :avg7, :decimal
		end
  end
end
