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
    factory :foo_image do
      image { Rack::Test::UploadedFile.new("spec/fixtures/foo.jpg", "image/jpg") }
    end
  end
end
