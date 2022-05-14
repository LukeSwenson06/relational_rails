# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Provider.destroy_all
OutpatientClinic.destroy_all

loveless = OutpatientClinic.create!(
  name: "Loveless",
  city: "Albuquerque",
  rank: 25,
  radiology: true,
  pediatrics: true,
  womens_health: true,
  referrals: false,
  clinic_services_provided: 16
)

general = OutpatientClinic.create!(
  name: "General",
  city: "San Diego",
  rank: 9,
  radiology: true,
  pediatrics: true,
  womens_health: true,
  referrals: false,
  clinic_services_provided: 21

)

loveless.providers.create!(
  name: "John Smith",
  age: 23,
  doctor: true,
  review_rating: 4
)

general.providers.create!(
  name: "Jane Doe",
  age: 34,
  doctor: true,
  review_rating: 5
)
