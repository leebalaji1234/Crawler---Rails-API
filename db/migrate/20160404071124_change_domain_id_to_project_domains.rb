class ChangeDomainIdToProjectDomains < ActiveRecord::Migration
  def change
  	change_column :project_domains, :domain_id, :string
  end
end
