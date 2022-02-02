FactoryBot.define do
  factory :user do
    first_name                  {"あああ"}
    last_name                   {"あああ"}
    f_first_name                {"アアア"}
    f_last_name                 {"アアア"}
    nickname                    {"aaa"}
    email                       {"aaaaaa@a.com"}
    password                    {"a1a1a1"}
    password_confirmation       {"a1a1a1"}
    dob                         {"2021-1-1"}
  end
end
