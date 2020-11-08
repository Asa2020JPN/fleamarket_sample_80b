FactoryBot.define do
  
  factory :address do
    last_name       {"山田"}
    first_name      {"太郎"}
    last_name_kana  {"ヤマダ"}
    first_name_kana {"タロウ"}
    postcode        {"123-4567"}
    prefecture_id   {"1"}
    city            {"渋谷区"}
    block           {"道玄坂2-10-12"}
    building        {"新大荘ビル８階"}
    phone_number    {"0000000000"}
  end

end