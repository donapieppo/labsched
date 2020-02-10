require 'rails_helper'

RSpec.describe Schedule, type: :model do
  subject { FactoryBot.create(:schedule) }

  it "has ical attribute as IceCube::Schedule" do
    expect(subject.ical).to be_a(IceCube::Schedule)
  end

  it "has start_date and end_date as in ical attribute" do
    expect(subject.start_time).to eq(subject.ical.start_time)
    expect(subject.end_time).to eq(subject.ical.end_time)
  end

  it "when change start_date in ical then changes start_date" do
    subject.ical.start_time = Time.now + 21.hours
    expect(subject.start_time).to eq(subject.ical.start_time)
  end

end
