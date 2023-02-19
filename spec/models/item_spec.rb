require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do

    context '商品出品できる時' do

      it '正しく情報が入力されれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do

      it "imageが存在しない場合は出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが存在しない場合は出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "explanatが存在しない場合は出品できない" do
        @item.explanat = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanat can't be blank")
      end

      it "priceが存在しない場合は出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "category_idが存在しない場合は出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "status_idが存在しない場合は出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "derivery_charge_idが存在しない場合は出品できない" do
        @item.derivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Derivery charge can't be blank")
      end

      it "sender_area_idが存在しない場合は出品できない" do
        @item.sender_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender area can't be blank")
      end

      it "daystosend_idが存在しない場合は出品できない" do
        @item.daystosend_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Daystosend can't be blank")
      end

      it "priceは全角では出品できない" do
        price = "１１１１"
        @item.price = price
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it "priceはひらがなが含まれると出品できない" do
        price = "1まん"
        @item.price = price
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it "priceは漢字が含まれると出品できない" do
        price = "1万"
        @item.price = price
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it "priceは全角カタカナが含まれると出品できない" do
        price = "1マン"
        @item.price = price
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it "priceは半角カタカナが含まれると出品できない" do
        price = "1ﾏﾝ"
        @item.price = price
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it "priceは記号が含まれると出品できない" do
        price = "¥10000"
        @item.price = price
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it "priceが300以下では出品できない" do
        price = "299"
        @item.price = price
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it "priceが9999999以上では出品できない" do
        price = "10000000"
        @item.price = price
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
    end
  end
end
