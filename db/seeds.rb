# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Measurement.create!(value: 17, date: DateTime.now(), user_id: 1, measure_id: 2)
Measurement.create!(value: 26, date: DateTime.now(), user_id: 1, measure_id: 3)
Measurement.create!(value: 32, date: DateTime.now(), user_id: 1, measure_id: 4)
User.create!(name: "Chrys", password_digest: 'chris414', email: "test@test,com")
Measure.create!(title: 'Head Circumference', unit: 'cm', description: 'The circular measurement of the head', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Height', unit: 'cm', description: 'Measure of head to feet', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Weight', unit: 'kg', description: 'Mass of the baby without much clothes', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Feet', unit: 'cm', description: 'Length of feet', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Hand', unit: 'cm', description: 'Length of hand from the finger to the shoulder', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Leg', unit: 'cm', description: 'Length of leg from foot to waist ', image: '/public/images/31010672.jpg')

Measurement.delete_all
User.delete_all
Measure.delete_all
