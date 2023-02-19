FactoryBot.define do
  factory :item do
    association :user
    name               {'商品名'}
    explanat           {'商品の説明'}
    price              {'10000'}
    category_id        {'2'}
    status_id          {'2'}
    derivery_charge_id {'2'}
    sender_area_id     {'2'}
    daystosend_id      {'2'}
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/item_sample.png'), filename: 'item_sample.png')
    end
  end
end
