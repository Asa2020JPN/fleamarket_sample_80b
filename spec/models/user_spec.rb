require 'rails_helper'

describe User do
  describe '#create' do

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameが空　登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank") 
    end

    it "passwordが空　登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank") 
    end

    it "passwordが6　登録できない" do
      user = build(:user, password: "0000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)") 
    end

    it "passwordが6以上の場合登録できる" do
      user = build(:user, password: "0123456789", password_confirmation: "0123456789")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが有りで、password_confirmationが空の場合　登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password") 
    end

    it "emailが空の場合　登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank") 
    end

    it "emailに＠がない場合　登録できない" do
      user = build(:user, email: 'aaa')
      user.valid?
      expect(user.errors[:email]).to include("is invalid", "is invalid") 
    end

    it "emailの＠の前にアドレスがない場合　登録できない" do
      user = build(:user, email: '@aaa')
      user.valid?
      expect(user.errors[:email]).to include("is invalid", "is invalid") 
    end

    it "重複したemail　登録できない" do
      user1 = create(:user)
      user2 = build(:user, email: user1.email)
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end
  end
end
