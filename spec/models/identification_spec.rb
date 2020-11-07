require 'rails_helper'

# bundle exec rspec spec/models/identification_spec.rb

RSpec.describe Identification, type: :model do
  describe '#create_identification' do
    context '保存できる' do
      it "last_name,、first_name、last_name_kana、first_name_kana、birthdayがあれば保存できる。" do
        expect(build(:identification)).to be_valid
      end

      it "last_nameに半角英字を入力で保存できる" do
        identification = build(:identification, last_name: "yamada")
        identification.valid?
        expect(identification.errors[:last_name]).to include("is invalid")
      end
  
  
      it "first_nameに半角英字を入力で保存できる" do
        identification = build(:identification, first_name: "taro")
        identification.valid?
        expect(identification.errors[:first_name]).to include("is invalid")
      end

      it "last_name_kanaにカナを入力" do
        expect(build(:identification, last_name_kana: "ヤマダ")).to be_valid
      end
  
      it "first_name_kanaに全角を入力" do
        expect(build(:identification, first_name_kana: "タロウ")).to be_valid
      end

      it "last_nameに全角を入力で保存できる" do
        expect(build(:identification, last_name: "山田")).to be_valid
      end

      it "first_nameに全角を入力で保存できる" do
        expect(build(:identification, first_name: "太郎")).to be_valid
      end
    end

    context '保存できない' do
      it "last_nameが空だと保存できない" do
        identification = build(:identification, last_name: nil)
        identification.valid?
        expect(identification.errors[:last_name]).to include("can't be blank")
      end
      it "first_nameが空だと保存できない" do
        identification = build(:identification, first_name: nil)
        identification.valid?
        expect(identification.errors[:first_name]).to include("can't be blank")
      end
  
      it "last_name_kanaが空だと保存できない" do
        identification = build(:identification, last_name_kana: nil)
        identification.valid?
        expect(identification.errors[:last_name_kana]).to include("can't be blank")
      end
  
      it "first_name_kanaが空だと保存できない" do
        identification = build(:identification, first_name_kana: nil)
        identification.valid?
        expect(identification.errors[:first_name_kana]).to include("can't be blank")
      end
  
      it "birthdayが空だと保存できない" do
        identification = build(:identification, birthday: nil)
        identification.valid?
        expect(identification.errors[:birthday]).to include("can't be blank")
      end

      it "last_name_kanaにひらがなを入力で保存できない" do
        identification = build(:identification, last_name_kana: "やまだ")
        identification.valid?
        expect(identification.errors[:last_name_kana]).to include("is invalid")
      end
  
      it "first_name_kanaにひらがなを入力で保存できない" do
        identification = build(:identification, first_name_kana: "たろう")
        identification.valid?
        expect(identification.errors[:first_name_kana]).to include("is invalid")
      end
  
      it "last_name_kanaに半角英字を入力で保存できない" do
        identification = build(:identification, last_name_kana: "yamada")
        identification.valid?
        expect(identification.errors[:last_name_kana]).to include("is invalid")
      end
  
      it "first_name_kanaに半角英字を入力で保存できない" do
        identification = build(:identification, first_name_kana: "taro")
        identification.valid?
        expect(identification.errors[:first_name_kana]).to include("is invalid")
      end

    end
  end
end