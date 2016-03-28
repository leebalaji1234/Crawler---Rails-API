class CreateWebProcessLogs < ActiveRecord::Migration
  def change
    create_table :web_process_logs do |t|
      t.references :source_web, index: true, foreign_key: true
      t.references :process_status, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
