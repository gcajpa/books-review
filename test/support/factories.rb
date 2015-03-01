FactoryGirl.define do
  factory :user do
    name 'John Doe'
    sequence(:email) {|n| "john#{n}@example.com.br"}
    password '123456'
    password_confirmation '123456'
  end
  factory :book do
    sequence(:title){ |n| "Livro de Algoritimo #{n}" }
    review 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe laborum ea dolorem error iure voluptates harum repudiandae quis, vel temporibus dolores ipsam, hic, enim ex odit animi repellat asperiores et.'
    association :user

    trait :completed do
      completed_at Time.current
    end
  end
end
