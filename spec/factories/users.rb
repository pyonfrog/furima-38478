FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000aaa'}
    password_confirmation {password}
    lastname              {'試験'}
    firstname             {'太郎'}
    pronounce_lastname    {'シケン'}
    pronounce_firstname   {'タロウ'}
    birthday              {'1930-01-01'}
  end
end