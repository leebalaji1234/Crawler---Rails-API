class CreateSchedulerTypes < ActiveRecord::Migration
  def change
    create_table :scheduler_types do |t|
      t.string :scheduler_name

      t.timestamps null: false
    end
  end
end
