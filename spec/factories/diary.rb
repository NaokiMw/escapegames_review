FactoryBot.define do
  factory :diary do
    title { "rspecからの脱出" }
    description { "楽しかった" }
    play_day { "2022-11-27" }
    start_time { "18:15" }
    result { "true" }
    status { "draft" }
    timelimit { "90" }
    players { "5" }
    friends { "3" }
    price { "2200" }
    after(:build) do |diary|
      diary.image.attach(io: File.open('spec/fixtures/files/foo.jpg'), filename: 'foo.jpg', content_type: 'image/jpg')
    end
  end
end
