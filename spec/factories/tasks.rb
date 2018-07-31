FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }
    size 3
    completed_at nil

    trait :small do
      size 1
    end

    trait :large do
      size 5
    end

    trait :soon do
      due_date { 1.day.from_now }
    end

    trait :later do
      due_date { 1.month.from_now }
    end

    trait :newly_complete do
      completed_at { 1.day.ago }
    end

    trait :long_complete do
      completed_at { 6.month.ago }
    end

    factory :trivial, class: Task, traits: %i[small later]
    factory :panic, class: Task, traits: %i[large soon]
  end
end