FactoryBot.define do
  factory :course do
    organization { FactoryBot.create(:organization) }
    user { FactoryBot.create(:user) }
    code {"test01"}
    name {"name test 01"}
  end
end
