FactoryGirl.define do
    factory :admin, class: User do
        email "admin@admin.com"
        password "password"
        admin true
    end
end