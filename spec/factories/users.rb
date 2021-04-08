FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'aaa111'}
    password_confirmation {password}
    first_name            {'あ'}
    first_name_kana        {'ア'}
    last_name            {'ん'}
    last_name_kana        {'ン'}
    birthday              {'2020-01-01'}
  end
end