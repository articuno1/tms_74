
10.times do |n|
  fullname = Faker::Name.name
  username = "trainerphp#{n+1}"
  password = "password"
  role = 0
  User.create!(fullname: fullname,
    username: username,
    password: password,
    password_confirmation: password,
    role: role)
end

10.times do |x|
  name_course = "Course Framgia no.#{x+1}"
  info_detail = "Course PHP no #{x+1}"
  status_course = 1
  Course.create!(name_course: name_course,
    info_detail: info_detail,
    status_course: status_course)
end


courses = Course.order("id DESC").take(9)
users = User.all

courses.each { |c|
  id_course = c.id
  status = 1
  users.each { |u|
    id_user = u.id
    UserCourse.create!(course_id: id_course,
                      user_id: id_user,
                      status_course: status)
  }
}
