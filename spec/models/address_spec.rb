require 'rails_helper'

# bundle exec rspec spec/models/address_spec.rb

RSpec.describe Address, type: :model do
  describe "#create_address" do
    context '保存できる' do
      it "last_name、first_name、last_name_kana、first_name_kana、postcode、city、block、building、prefecture_id、phone_numberがあれば保存できる" do
        expect(build(:address)).to be_valid
      end

      it "buildingは空でも保存できる" do
        expect(build(:address, building: nil)).to be_valid
      end

      it "phone_numberは空でも保存できる" do
        expect(build(:address, phone_number: nil)).to be_valid
      end

      it "last_nameに全角を入力で保存できる" do
        expect(build(:address, last_name: "山田")).to be_valid
      end

      it "first_nameに全角を入力で保存できる" do
        expect(build(:address, first_name: "太郎")).to be_valid
      end

      it "last_name_kanaにカナを入力で保存できる" do
        expect(build(:address, last_name_kana: "ヤマダ")).to be_valid
      end
      
      it "first_name_kanaにカナを入力で保存できる" do
        expect(build(:address, first_name_kana: "タロウ")).to be_valid
      end

      it "first_name_kanaにカナを入力で保存できる" do
        expect(build(:address, first_name_kana: "タロウ")).to be_valid
      end

      it '10けた保存で保存できる' do
        expect(build(:address, phone_number: "1234567890")).to be_valid
      end

      it '11桁保存で保存できる' do
        expect(build(:address, phone_number: "12345678901")).to be_valid
      end
    end

    context '保存できない' do
      it "last_nameは空と保存できない" do
        address = build(:address, last_name: nil)
        address.valid?
        expect(address.errors[:last_name]).to include("can't be blank")
      end

      it "first_nameは空と保存できない" do
        address = build(:address, first_name: nil)
        address.valid?
        expect(address.errors[:first_name]).to include("can't be blank")
      end

      it "last_name_kanaは空と保存できない" do
        address = build(:address, last_name_kana: nil)
        address.valid?
        expect(address.errors[:last_name_kana]).to include("can't be blank")
      end

      it "first_name_kanaは空と保存できない" do
        address = build(:address, first_name_kana: nil)
        address.valid?
        expect(address.errors[:first_name_kana]).to include("can't be blank")
      end

      it "postcodeは空と保存できない" do
        address = build(:address, postcode: nil)
        address.valid?
        expect(address.errors[:postcode]).to include("can't be blank")
      end
  
      it "prefecture_idは空と保存できない" do
        address = build(:address, prefecture_id: nil)
        address.valid?
        expect(address.errors[:prefecture_id]).to include("can't be blank")
      end
  
      it "cityは空と保存できない" do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("can't be blank")
      end
  
      it "blockは空と保存できない" do
        address = build(:address, block: nil)
        address.valid?
        expect(address.errors[:block]).to include("can't be blank")
      end
#
      it "last_nameに半角英字を入力すると保存できない" do
        address = build(:address, last_name: "yamada")
        address.valid?
        expect(address.errors[:last_name]).to include("is invalid")
      end
    
      it "first_nameに半角英字を入力すると保存できない" do
        address = build(:address, first_name: "taro")
        address.valid?
        expect(address.errors[:first_name]).to include("is invalid")
      end
    
      it "last_name_kanaにひらがなを入力すると保存できない" do
        address = build(:address, last_name_kana: "やまだ")
        address.valid?
        expect(address.errors[:last_name_kana]).to include("is invalid")
       end
      
      it "first_name_kanaにひらがなを入力すると保存できない" do
        address = build(:address, first_name_kana: "たろう")
        address.valid?
        expect(address.errors[:first_name_kana]).to include("is invalid")
      end
      
      it "last_name_kanaに半角英字を入力すると保存できない" do
        address = build(:address, last_name_kana: "yamada")
        address.valid?
        expect(address.errors[:last_name_kana]).to include("is invalid")
      end
      
      it "first_name_kanaに半角英字を入力すると保存できない" do
        address = build(:address, first_name_kana: "taro")
        address.valid?
        expect(address.errors[:first_name_kana]).to include("is invalid")
      end

      it 'postcodeにハイフンがないと保存できない' do
        address = build(:address, postcode: "1234567")
        address.valid?
        expect(address.errors[:postcode]).to include("is invalid")
      end

      it 'postcodeの桁数が違う（前半４桁）と保存できない' do
        address = build(:address, postcode: "0123-4567")
        address.valid?
        expect(address.errors[:postcode]).to include("is invalid")
      end

      it 'postcodeの桁数が違う（後半５桁）と保存できない' do
        address = build(:address, postcode: "123-45678")
        address.valid?
        expect(address.errors[:postcode]).to include("is invalid")
      end

      it 'postcodeにひらがなを入力すると保存できない' do
        address = build(:address, postcode: "あいう-かきくけ")
        address.valid?
        expect(address.errors[:postcode]).to include("is invalid")
      end

      it 'phone_numberが９文字以下だと保存できない' do
        address = build(:address, phone_number: "123456789")
        address.valid?
        expect(address.errors[:phone_number]).to include("is invalid")
      end

      it 'phone_numberにひらがなを入力すると保存できない' do
        address = build(:address, phone_number: "あいうえおかきくけこ")
        address.valid?
        expect(address.errors[:phone_number]).to include("is invalid")
      end
    end
  end
end