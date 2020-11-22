require 'rails_helper'

describe Product do
  describe '#create' do
    it "nameがなければ登録できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
    
    it "detailがなければ登録できないこと" do
      product = build(:product, detail: nil)
      product.valid?
      expect(product.errors[:detail]).to include("can't be blank")
    end

    it "priceがなければ登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "status_idがなければ登録できないこと" do
      product = build(:product, status_id: nil)
      product.valid?
      expect(product.errors[:status_id]).to include("can't be blank")
    end    

    it "prefecture_idがなければ登録できないこと" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end

    it "shippingcost_idがなければ登録できないこと" do
      product = build(:product, shippingcost_id: nil)
      product.valid?
      expect(product.errors[:shippingcost_id]).to include("can't be blank")
    end

    it "shippind_idがなければ登録できないこと" do
      product = build(:product, shipping_id: nil)
      product.valid?
      expect(product.errors[:shipping_id]).to include("can't be blank")
    end
  end

  describe '#update' do
    it "nameがなければ登録できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
    
    it "detailがなければ登録できないこと" do
      product = build(:product, detail: nil)
      product.valid?
      expect(product.errors[:detail]).to include("can't be blank")
    end

    it "priceがなければ登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "status_idがなければ登録できないこと" do
      product = build(:product, status_id: nil)
      product.valid?
      expect(product.errors[:status_id]).to include("can't be blank")
    end    

    it "prefecture_idがなければ登録できないこと" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end

    it "shippingcost_idがなければ登録できないこと" do
      product = build(:product, shippingcost_id: nil)
      product.valid?
      expect(product.errors[:shippingcost_id]).to include("can't be blank")
    end

    it "shippind_idがなければ登録できないこと" do
      product = build(:product, shipping_id: nil)
      product.valid?
      expect(product.errors[:shipping_id]).to include("can't be blank")
    end
  end

end