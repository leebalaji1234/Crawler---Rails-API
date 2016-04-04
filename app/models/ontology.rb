class Ontology < ActiveRecord::Base
  belongs_to :domain 
  scope :ontologylists, -> {where(:id => items)}
   

  def self.ontologylists(items)

  	if items.present?
  		logger.info "items are => #{items}"
      where(:id => items)
    else
      all
    end
  end

end
