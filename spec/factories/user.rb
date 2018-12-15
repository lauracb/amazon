# Actúa para crear nuevos registros como el fixture
FactoryBot.define do
    factory :user do
        email {" email-test@gmail.com "}
        password { "hola1234" }
    end
end