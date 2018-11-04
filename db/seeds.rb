# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin.create(email: "admin@example.com", password: "password", password_confirmation: "password")

# (1..6).to_a.each do |id|
#   Category.create(name: Faker::Coffee.blend_name)
# end

# Category.all.map(&:id).each do |id|
#   (1..3).to_a.each do |i|
#     Product.create(
#       name: Faker::Lorem.sentence(3),
#       price: Faker::Number.between(10, 100),
#       category_id: id
#     )
#   end
# end


# def to_slug(str)
#   #strip the string
#   ret = str.strip

#   #blow away apostrophes
#   ret.gsub! /['`]/,""

#   # @ --> at, and & --> and
#   ret.gsub! /\s*@\s*/, " at "
#   ret.gsub! /\s*&\s*/, " and "

#   #replace all non alphanumeric, underscore or periods with underscore
#    ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'  

#    #convert double underscores to single
#    ret.gsub! /_+/,"_"

#    #strip off leading/trailing underscore
#    ret.gsub! /\A[_\.]+|[_\.]+\z/,""

#    ret.downcase
# end

# ["Architecture and Engineering", "Arts, Design, Entertainment, Sports, and Media", "Building and Grounds Cleaning and Maintenance", "Business and Financial Operations", "Community and Social Services", "Computer and Mathematical", "Construction and Extraction", "Education, Training, and Library", "Farming, Fishing, and Forestry", "Food Preparation and Serving Related", "Healthcare Practitioners and Technical", "Healthcare Support", "Installation, Maintenance, and Repair", "Legal", "Life, Physical, and Social Science", "Management", "Military Specific", "Office and Administrative Support", "Personal Care and Service", "Production", "Protective Service", "Sales and Related"].each do |name|
#   OccupationalCategory.create(name: name, slug: to_slug(name) )
# end


# (1..5).to_a.each do |i|
#   Company.create(
#     name: Faker::Company.name,
#     email: Faker::Internet.safe_email,
#     phone: Faker::PhoneNumber.phone_number,
#     address: Faker::Address.full_address
#   )
# end

Company.all.each do |c|
  
  # t.text "title"
  # t.text "job_location"
  # t.string "base_salary"
  # t.integer "employment_type_cd"
  # t.integer "work_hours"
  # t.text "description"
  # t.string "education_requirements"
  # t.date "date_posted"
  # t.date "valid_through"
  (1..20).to_a.each do |i|
    job = c.jobs.build(occupational_category_id: OccupationalCategory.pluck(:id).sample)
    job.attributes = {
      title: Faker::Job.title,
      job_location: c.address,
      base_salary: Faker::Number.number(4).to_s,
      employment_type_cd: (1..5).to_a.sample,
      work_hours: 8,
      description: Faker::Lorem.paragraph(2),
      education_requirements: Faker::Job.education_level,
      date_posted: Date.today,
      valid_through: Date.today + 30
    }
    job.save!
  end
end