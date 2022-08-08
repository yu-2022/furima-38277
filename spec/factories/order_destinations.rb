FactoryBot.define do
  factory :order_destination do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市' }
    block { '1-1' }
    building { '柳ビル' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
