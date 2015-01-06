# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
cities = City.create([{
  name: 'Barranquilla' },
  { name: 'Cali' },
  { name: 'Medellin' },
  { name: 'Bogota' },
  { name: 'Lorica' },
  { name: 'Palmira' },
  { name: 'Buga' },
  { name: 'Pereira' },
  { name: 'Tulua' },
  ])
#   Mayor.create(name: 'Emanuel', city: cities.first)

states = State.create([{
  name: 'Atlantico' },
  { name: 'Valle del Cauca' },
  { name: 'Antioquia' },
  { name: 'Cundinamarca' },
  { name: 'Cordoba' },
  { name: 'Risaralda' },
  { name: 'Magdalena' },
  { name: 'Sucre' },
  { name: 'Cesar' },
  ])

categories = Category.create([{
  name: 'Musica' },
  { name: 'Belleza' },
  { name: 'Niños' },
  { name: 'Aventura' },
  { name: 'Deportes' },
  { name: 'Hogar' },
  { name: 'Tecnologia' },
  { name: 'Libros' },
  { name: 'Ropa' },
  { name: 'Zapatos' },
  { name: 'Automoviles' },
  ])

p "Created #{City.count} cities"
p "Created #{State.count} states"
p "Created #{Category.count} categories"
