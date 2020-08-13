FactoryBot.define do
  factory :user do
    nickname              {"sakuragi"}
    email                 {"sakuragi@gmail.com"}
    password              {"sakuragi1031"}
    password_confirmation {password}
    last_name             {"桜木"}
    first_name            {"花道"}
    last_name_reading     {"サクラギ"}
    first_name_reading    {"ハナミチ"}
    birthday              {19840401}
  end
end

#   nickname              {Faker::Name.nickname}
#   email                 {Faker::Internet.free_email}
#   password = Faker::Internet.password(min_length: 6)
#   password              {password}
#   password_confirmation {password}
#   last_name             {Faker::Name.last_name}
#   first_name            {Faker::Name.first_name}
#   last_name_reading     {Faker::Name.last_name_reading}
#   first_name_reading    {Faker::Name.first_name_reading}
#   birthday