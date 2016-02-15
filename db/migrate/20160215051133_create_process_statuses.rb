class CreateProcessStatuses < ActiveRecord::Migration
  def change
    create_table :process_statuses do |t|
      t.string :process_status

      t.timestamps null: false
    end
  end
end
