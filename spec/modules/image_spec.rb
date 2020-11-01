require 'rails_helper'

describe Image do
  describe '#create' do
    it "imageがなければ登録できないこと" do
      product = build(:image, image: nil)
      product.valid?
      expect(product.errors[:image]).to include("can't be blank")
    end
  end
end