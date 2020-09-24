FactoryBot.define do
  factory :product do
    name               {"あああああ"}
    explanation        {"あああああ"}
    genre_id           {1}
    status_id          {1}
    burden_id          {1}
    area_id            {1}
    days_id            {1}
    value              {1111}
    association :user 
    
    # after(:build) do |product|
    #   product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end

  end
end