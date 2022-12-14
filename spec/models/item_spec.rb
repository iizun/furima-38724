require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it 'image,item_name,summary,category_id,condition_id,delivery_day_id,prefecture_id,delivery_day_id,価格が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できない場合' do
      it '商品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名がないと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明がないと登録できない' do
        @item.summary = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '商品のカテゴリーが未選択だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品の状態が未選択だと登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料の負担が未選択だと登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '発送元の地域が未選択だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '発送までの日数が未選択だと登録できない' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it '商品の価格が未入力だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は半角数字で¥300〜9,999,999の範囲で入力してください")
      end
      it '商品の価格が300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it '商品の価格が9999999より大きいと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it '商品の価格が半角英字だと登録できない' do
        @item.price = 'aaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it '商品の価格が記号だと登録できない' do
        @item.price = '*******'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it '商品の価格が全角英字だと登録できない' do
        @item.price = 'ＡＡＡＡＡＡＡ '
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it '商品の価格が全角数字だと登録できない' do
        @item.price = '１１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it '商品の価格が全角漢字だと登録できない' do
        @item.price = '亜亜亜亜亜亜亜'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it '商品の価格が全角かなだと登録できない' do
        @item.price = 'あああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it '商品の価格が全角カナだと登録できない' do
        @item.price = 'アアアアアアア'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で¥300〜9,999,999の範囲で入力してください')
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
