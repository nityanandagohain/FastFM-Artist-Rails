FactoryBot.define do
    factory :user do
        id { 1 }
        email { "xyz@xyz.com" }
        password { "hellopassword" }
    end
end