class CreateOntologies < ActiveRecord::Migration
  def change
    create_table :ontologies do |t|
      t.string :name
      t.string :url
      t.references :domain, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
