FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    lastname              {'試験'}
    firstname             {'太郎'}
    pronounce_lastname    {'シケン'}
    pronounce_firstname   {'タロウ'}
    birthday              {'1930-01-01'}
    created_at            {'2023-01-31 12:41:33.109162'}
    updated_at            {'2023-01-31 12:41:33.109162'}

  end
end