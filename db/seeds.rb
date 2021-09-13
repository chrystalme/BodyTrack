# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Measurement.delete_all
User.delete_all
Measure.delete_all
User.create!(name: "Chrys", password_digest: 'chris414', email: "test@test,com")
Measure.create!(title: 'Head Circumference', description: 'The circular measurement of the head', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Height', description: 'Measure of head to feet', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Weight', description: 'Mass of the baby without much clothes', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Feet', description: 'Length of feet', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Hand', description: 'Length of hand from the finger to the shoulder', image: '/public/images/31010672.jpg')
Measure.create!(title: 'Leg', description: 'Length of leg from foot to waist ', image: '/public/images/31010672.jpg')

Measurement.create!(value: 17, date: DateTime.now(), user_id: 1, measure_id: 2)
Measurement.create!(value: 26, date: DateTime.now(), user_id: 1, measure_id: 3)
Measurement.create!(value: 32, date: DateTime.now(), user_id: 1, measure_id: 4)
