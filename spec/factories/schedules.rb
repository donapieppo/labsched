FactoryBot.define do
  factory :schedule do
    course { FactoryBot.create(:course) }
    lab { FactoryBot.create(:lab) }
    start_time { Time.now + 1.day }
    end_time   { Time.now + 1.day + 2.hours }
  end
end


