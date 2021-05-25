require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '保存できる場合' do
      
      it '商品名、説明文、カテゴリー、状態、配送料、都道府県、発送日、価格、商品画像があれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合'do

      it '商品名が空では出品できないこと' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.messages[:title]).to include("を入力してください") 
      end

      it '説明文が空では出品できないこと' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーが「--」の選択肢では出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it '状態が「--」の選択肢では出品できないこと' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it '配送料が「--」の選択肢では出品できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it '都道府県が「--」の選択肢では出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '発送日が「--」の選択肢では出品できないこと' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '価格が空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it '価格が全角文字では出品できないこと' do
        @item.price = 'ほげ'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it '価格が半角英数字混合では出品できないこと' do
        @item.price = "hoge11"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it '価格が半角英語では出品できないこと' do
        @item.price = "hoge"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it '画像がなければ出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を選択してください")
      end

      it 'ユーザーが紐づいていなければ出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ユーザーを入力してください")
      end

      it '価格が299円以下では出品できないこと' do
        @item.price = Faker::Number.between( from:0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300円以上、10,000,000円未満に設定してください")
      end

      it '価格が10000000円以上では出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300円以上、10,000,000円未満に設定してください")
      end
    end
  end
end