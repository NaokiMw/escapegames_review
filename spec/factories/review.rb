FactoryBot.define do
  factory :review do
    title {"reviewtest"}
    review_1 {"3"} 
    review_2 {"ルーム"}
    review_3 {"学生向き"} 
    review_4 {"ひくい"}
    review_5 {"激ムズ"}
    place {"東京"} 
    play_day {"2022/11/11"}
    start_time {"17:30"} 
    result {"true"} 
    after(:build) do |review|
      review.image.attach(io: File.open('spec/fixtures/files/foo.jpg'), filename: 'foo.jpg', content_type: 'image/jpg')
    end
  end
end
