FactoryBot.define do
    factory :diary do
      title {"rspecからの脱出"}
      description {"楽しかった"}
      play_day {"2022-11-27"}
      start_time {"18:15"}
      result {"true"}
      status {"draft"}
    end
  end
