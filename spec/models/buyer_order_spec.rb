require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      # @buyer = FactoryBot.create(:buyer, user_id: @user.id, item_id: @item.id)
      @order = FactoryBot.build(:buyer_order, user_id: @user.id, item_id: @item.id)
    end

    context '保存できる場合' do
      
      it 'トークン、郵便番号、都道府県、市区町村、番地、建物名、電話番号があれば購入できること' do
        expect(@order).to be_valid
      end

      it 'トークン、郵便番号、都道府県、市区町村、番地、電話番号があれば購入できること' do
        expect(@order).to be_valid
      end

    end

    context '保存できない場合' do
      
      it 'トークンがないと購入できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では購入できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が全角文字では購入できないこと' do
        @order.postal_code = '１１１１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が半角英語では購入できないこと' do
        @order.postal_code = 'abcabcabc'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が半角英数字混合では購入できないこと' do
        @order.postal_code = 'hoge1111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が半角数字だけでは購入できないこと' do
        @order.postal_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が6桁以下では購入できないこと' do
        @order.postal_code = '111-111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が3文字目と4文字目の間にハイフンがなければ購入できないこと' do
        @order.postal_code = '1111-111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が「--」の選択肢では購入できないこと' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空では購入できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が全角文字では購入できないこと' do
        @order.phone_number = 'ほげほげほげほげほげ'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が半角英語では購入できないこと' do
        @order.phone_number = 'hogehogeho'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が半角英数字混合では購入できないこと' do
        @order.phone_number = 'hoge1hoge1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が9文字以下では購入できないこと' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が12文字以上では購入できないこと' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'ユーザーが紐づいていなければ購入できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it '商品が紐づいていなければ購入できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end