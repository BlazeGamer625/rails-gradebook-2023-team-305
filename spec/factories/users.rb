FactoryBot.define do
  factory :user do
      sequence(:email) { |n| "person-#{n}@example.com" }
      password { '123greetings' }


      trait :teacher do
        account_id { 1 }
        
      end
  
      trait :ta do
        account_id { 0 }
        
      end

  end
end