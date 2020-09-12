FactoryBot.define do
 factory :user do
  nickname              {Faker::Name.initials(number: 2)}
  email                 {Faker::Internet.free_email}
  password              {"aa111111"}
  password_confirmation {password}
  first_name            {"ああああ"}
  last_name             {"ああああ"}
  read_first            {"アアアア"}
  read_last             {"アアアア"}
  birth                 {"1999-02-02"}
  end
end