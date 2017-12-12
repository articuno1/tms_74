User.create!(fullname:  "Le Duc Duy",
  username: "leducduy",
  password: "123456",
  password_confirmation: "123456",
  role: 1)

10.times do |n|
  fullname = Faker::Name.name
  username = "example#{n+1}"
  password = "password"
  role = "2"
  User.create!(fullname: fullname,
    username: username,
    password: password,
    password_confirmation: password,
    role: role)
end

10.times do |x|
  name_course = "Course Framgia no.#{x+1}"
  info_detail = "Course Ruby no #{x+1}"
  Course.create!(name_course: name_course, info_detail: info_detail)
end

arr = ["Git","Ruby","Ruby on rails 5","Scrum","PHP","Android"]
5.times do |x|
  name_subject = arr[x]+" Tutorial"
  info_detail = "This is description of Subject"
  Subject.create!(name_subject: name_subject, info_detail: info_detail)
end

courses = Course.order("id DESC").take(6)
subjects = Subject.all

courses.each { |c|
  id_course = c.id
  subjects.each { |s|
    id_subject = s.id
    status = 0
    date_start = Time.zone.now
    date_end = Time.zone.now + 5.day
    CourseSubject.create!(course_id: id_course,
                        subject_id: id_subject,
                        status_subject: status,
                        begin_day: date_start,
                        end_day: date_end)
  }
}
