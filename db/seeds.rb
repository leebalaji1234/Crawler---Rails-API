# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Channels = Channel.create([{channel_name:'Facebook'},{channel_name:'Twitter'},{channel_name:"Instagram"}])
SchedulerTypes = SchedulerType.create([{scheduler_name:'Only Once'},{scheduler_name:'Hourly'},{scheduler_name:'Daily'},{scheduler_name:'Weekly'},{scheduler_name:'Monthly'}])
Domains = Domain.create([{name:'Bank'},{name:'Retail'},{name:'Travels'}])
Ontologies = Ontology.create([{domain_id:1,name:'Vehicle selling',url:'http://localhost/vsop.owl'},{domain_id:2,name:'Vehicle selling1',url:'http://localhost/vsop.owl'},{domain_id:3,name:'Vehicle selling2',url:'http://localhost/vsop.owl'}])