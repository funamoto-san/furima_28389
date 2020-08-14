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