require 'rails_helper'
describe Identification do
  describe '#create_identification' do

    it "is valid with a last_name, first_name, last_name_kana, first_name_kana, birthday" do
      identification = build(:identification)
      expect(identification).to be_valid
    end

    # null: false
    it "is invalid without a last_name" do
      identification = build(:identification, last_name: nil)
      identification.valid?
      expect(identification.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      identification = build(:identification, first_name: nil)
      identification.valid?
      expect(identification.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana" do
      identification = build(:identification, last_name_kana: nil)
      identification.valid?
      expect(identification.errors[:last_name_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      identification = build(:identification, first_name_kana: nil)
      identification.valid?
      expect(identification.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
      identification = build(:identification, birthday: nil)
      identification.valid?
      expect(identification.errors[:birthday]).to include("can't be blank")
    end

    # 全角のみ
    it "last_nameに全角を入力" do
      identification = build(:identification, last_name: "山田")
      expect(identification).to be_valid
    end

    it "last_nameに半角英字を入力" do
      identification = build(:identification, last_name: "yamada")
      identification.valid?
      expect(identification.errors[:last_name]).to include("is invalid")
    end

    it "first_nameに全角を入力" do
      identification = build(:identification, first_name: "太郎")
      expect(identification).to be_valid
    end

    it "first_nameに半角英字を入力" do
      identification = build(:identification, first_name: "taro")
      identification.valid?
      expect(identification.errors[:first_name]).to include("is invalid")
    end

    # カナのみ
    it "last_name_kanaにカナを入力" do
      identification = build(:identification, last_name_kana: "ヤマダ")
      expect(identification).to be_valid
    end

    it "first_name_kanaに全角を入力" do
      identification = build(:identification, first_name_kana: "タロウ")
      expect(identification).to be_valid
    end

    it "last_name_kanaにひらがなを入力" do
      identification = build(:identification, last_name_kana: "やまだ")
      identification.valid?
      expect(identification.errors[:last_name_kana]).to include("is invalid")
    end

    it "first_name_kanaにひらがなを入力" do
      identification = build(:identification, first_name_kana: "たろう")
      identification.valid?
      expect(identification.errors[:first_name_kana]).to include("is invalid")
    end

    it "last_name_kanaに半角英字を入力" do
      identification = build(:identification, last_name_kana: "yamada")
      identification.valid?
      expect(identification.errors[:last_name_kana]).to include("is invalid")
    end

    it "first_name_kanaに半角英字を入力" do
      identification = build(:identification, first_name_kana: "taro")
      identification.valid?
      expect(identification.errors[:first_name_kana]).to include("is invalid")
    end

  end
end