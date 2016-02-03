class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :description, limit: 1000

      t.timestamps null: false
    end
  end
end
