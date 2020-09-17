FactoryBot.define do
  factory :product do
    name               {"あああああ"}
    explanation        {"あああああ"}
    genre_id           {"あああああ"}
    status_id          {"あああああ"}
    burden_id          {"あああああ"}
    area_id            {"あああああ"}
    days_id            {"あああああ"}
    value              {"1111"}
    association :user 
    
    # after(:build) do |product|
    #   product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end

  end
end