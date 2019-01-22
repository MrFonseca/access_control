# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
House.create(number: '057', address: 'A street', route: 'go ahead', status: 'for sale')
House.create(number: '144', address: 'F street', route: '1st left', status: 'sold')
House.create(number: '226', address: 'C street', route: '1st left and 2nd right', status: 'sold')
House.create(number: '255', address: 'H street', route: '3rd left', status: 'rented')
House.create(number: '314', address: 'J street', route: '5th left', status: 'for rent')
House.create(number: '600', address: 'M street', route: '6th left', status: 'for sale')

Person.create(name: 'John',     document: '1234', phone: '99889988', house_id: 1)
Person.create(name: 'Paul',     document: '1324', phone: '98989898', house_id: 1)
Person.create(name: 'George',   document: '1243', phone: '89898989', house_id: 2)
Person.create(name: 'Ringo',    document: '1342', phone: '88998899', house_id: 3)
Person.create(name: 'Mick',     document: '1423', phone: '99989888', house_id: 4)
Person.create(name: 'Keith',    document: '1432', phone: '98889998', house_id: 5)
Person.create(name: 'Ron',      document: '2134', phone: '98898998', house_id: 4)
Person.create(name: 'Charles',  document: '2143', phone: '89989889', house_id: 2)
Person.create(name: 'Roger',    document: '2314', phone: '99998888', house_id: 3)
Person.create(name: 'David',    document: '2341', phone: '88889999', house_id: 5)
Person.create(name: 'Richard',  document: '2413', phone: '88898999', house_id: 3)
Person.create(name: 'Nick',     document: '2431', phone: '89999888', house_id: 5)
Person.create(name: 'Robert',   document: '3124', phone: '98888999', house_id: 1)
Person.create(name: 'Jimmy',    document: '3142', phone: '99899888', house_id: 2)
Person.create(name: 'Joe Paul', document: '3214', phone: '88988999', house_id: 3)
Person.create(name: 'Jason',    document: '3241', phone: '99898988', house_id: 4)
Person.create(name: 'Jane',     document: '9876', phone: '77667766', house_id: nil)
Person.create(name: 'David',    document: '9867', phone: '66776677', house_id: nil)
Person.create(name: 'Bruce',    document: '9786', phone: '76767676', house_id: nil)
Person.create(name: 'Elvis',    document: '9768', phone: '67676767', house_id: nil)

Vehicle.create(plate: 'AAA 0101', brand: 'Ford',    model: 'KA',     color: 'black',  year: 2017, house_id: 5)
Vehicle.create(plate: 'QQQ 1234', brand: 'GM',      model: 'Onix',   color: 'silver', year: 2016, house_id: 4)
Vehicle.create(plate: 'WER 0987', brand: 'Fiat',    model: 'Palio',  color: 'white',  year: 2010, house_id: 5)
Vehicle.create(plate: 'FGB 4567', brand: 'VW',      model: 'Gol',    color: 'red',    year: 2007, house_id: 4)
Vehicle.create(plate: 'ETY 3248', brand: 'Renault', model: 'Clio',   color: 'green',  year: 2004, house_id: 3)
Vehicle.create(plate: 'LHB 0666', brand: 'Citroen', model: 'C3',     color: 'black',  year: 2012, house_id: 2)
Vehicle.create(plate: 'NTF 8585', brand: 'Ford',    model: 'Fiesta', color: 'blue',   year: 2000, house_id: 2)
Vehicle.create(plate: 'JBT 7392', brand: 'GM',      model: 'Celta',  color: 'white',  year: 2010, house_id: nil)
Vehicle.create(plate: 'EUV 5543', brand: 'Ford',    model: 'Focus',  color: 'silver', year: 2017, house_id: nil)
Vehicle.create(plate: 'SVG 4534', brand: 'VW',      model: 'Up',     color: 'white',  year: 2018, house_id: nil)
Vehicle.create(plate: 'DFB 1454', brand: 'VW',      model: 'Voyage', color: 'red',    year: 2015, house_id: nil)
Vehicle.create(plate: 'JHV 6247', brand: 'Fiat',    model: '500',    color: 'red',    year: 2017, house_id: nil)

Pet.create(species: 'dog', breed: 'poodle',  color: 'white',  gender: 'male',   size: 'small',  name: "Jon", house_id: 1)
Pet.create(species: 'dog', breed: 'bulldog', color: 'brown',  gender: 'female', size: 'small',  name: "Sansa", house_id: 2)
Pet.create(species: 'dog', breed: 'pitbull', color: 'white',  gender: 'male',   size: 'medium', name: "Bran", house_id: 3)
Pet.create(species: 'cat', breed: 'siamese', color: 'white',  gender: 'male',   size: 'small',  name: "Tirion", house_id: 4)
Pet.create(species: 'cat', breed: 'persian', color: 'yellow', gender: 'female', size: 'small',  name: "Denny", house_id: 4)
Pet.create(species: 'cat', breed: 'mixed',   color: 'black',  gender: 'female', size: 'small',  name: "Aria", house_id: 4)

Visit.create(person_id: 17, house_id: 1, vehicle_id: 12,  contract_type: 'freelancer', work_days: nil, enter_date: '01/10/2018', leave_date: '02/11/2018')
Visit.create(person_id: 18, house_id: 2, vehicle_id: nil, contract_type: nil,          work_days: nil, enter_date: '01/10/2018', leave_date: '01/10/2018')
Visit.create(person_id: 19, house_id: 3, vehicle_id: 11,  contract_type: nil,          work_days: nil, enter_date: '01/07/2018', leave_date: '01/07/2018')
Visit.create(person_id: 19, house_id: 4, vehicle_id: 11,  contract_type: nil,          work_days: nil, enter_date: '07/15/2018', leave_date: '07/15/2018')
Visit.create(person_id: 19, house_id: 4, vehicle_id: 10,  contract_type: nil,          work_days: nil, enter_date: '08/23/2018', leave_date: '08/23/2018')
Visit.create(person_id: 19, house_id: 2, vehicle_id: 9,   contract_type: nil,          work_days: nil, enter_date: '08/25/2018', leave_date: '08/25/2018')
Visit.create(person_id: 19, house_id: 1, vehicle_id: 8,   contract_type: nil,          work_days: nil, enter_date: '09/14/2018', leave_date: '09/14/2018')
Visit.create(person_id: 20, house_id: 5, vehicle_id: 7,   contract_type: nil,          work_days: nil, enter_date: '10/22/2018', leave_date: '10/22/2018')
