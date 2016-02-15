class CreateSocialProcessLogs < ActiveRecord::Migration
  def change
    create_table :social_process_logs do |t|
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :source_social, index: true, foreign_key: true
      t.references :process_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
