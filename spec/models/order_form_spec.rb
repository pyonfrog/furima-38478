require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end

      it '建物名が入力されていない場合でも保存できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      
      it '郵便番号が空だと保存できない' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
     
      it '郵便番号にハイフンがないと保存できない' do
        @order_form.postal_code = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
     
      it '都道府県が「---」だと保存できない' do
        @order_form.sender_area_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Sender area must be other than 0")
      end

      it '都道府県が空だと保存できない' do
        @order_form.sender_area_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Sender area can't be blank")
      end

      it '市区町村が空だと保存できない' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空だと保存できない' do
        @order_form.house_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @order_form.tell = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tell can't be blank")
      
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_form.tell = '123 - 1234 - 1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tell is invalid')
      end

      it '電話番号が12桁以上あると保存できない' do
        @order_form.tell = 12_345_678_910_123_111
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tell is invalid')
      end

      it '電話番号が9桁以下では保存できない' do
        @order_form.tell = 12_345_678
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tell is invalid')
      end

      it 'トークンが空だと保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end