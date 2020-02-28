FactoryBot.define do
  factory :exhibition do
    # images_attributes                 {"kkk@gmail.com"} 
    item_name                 {"アンパンマンぐみ"}   
    item_description          {"高知県限定バージョンです"}
    category_id               {"その他"}
    item_status               {"未使用"}
    shipping_charges          {"送料込み（出品者負担）"}
    prefecture_id             {"37"}
    shipping_date             {"1~2日で発送"}
    price                     {"300"}
  end
end
