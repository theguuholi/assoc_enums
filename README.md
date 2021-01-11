

Table scolar_ship as p{
  id int [pk, increment]
  full_price decimal
  price_with_discount decimal
  discount_percentage decimal
  start_date datetime
  enrollment_semester text
  enable boolean
  }

Ref: course.scolar_ship_id > scolar_ship.id

Table course {
  id int [pk, increment]
  name text
  kind text
  level text
  shift text
  scolar_ship_id integer
}


Table campus {
  id int [pk, increment]
  name text
  city text
  course_id integer
  university_id integer
}

Ref: campus.course_id > course.id

Table university {
  id int [pk, increment]
  name text
  score decimal
  logo_url decimal
  campus_id integer
}

Ref: university.campus_id > campus.id





//Ref: students.personal_id > personals.id




❯ mix phx.gen.schema Course courses name kind level shift campus_id:references:campus
https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Schema.html
https://jsonlint.com


❯ mix phx.new assoc_enums --no-html --no-webpack --binary-id
