require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'post_code,prefecture_id,city,house_number,building_number,phone_number,token,user_id,item_idが存在すれば登録できる' do
        expect(@order_ship).to be_valid
      end
      it 'building_numberが空でも登録できる' do
        @order_ship.building_number = ''
        expect(@order_ship).to be_valid
      end
    end
    context '購入できない場合' do
      it 'post_codeが存在しないと登録できない' do
        @order_ship.post_code = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("郵便番号を入力してください", "郵便番号はハイフンを含めて入力してください")
      end
      it 'post_codeにハイフンがないと登録できない' do
        @order_ship.post_code = '1140021'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('郵便番号はハイフンを含めて入力してください')
      end
      it 'post_codeが前3桁でなければ登録できない' do
        @order_ship.post_code = '0021-0021'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('郵便番号はハイフンを含めて入力してください')
      end
      it 'post_codeが後4桁でなければ登録できない' do
        @order_ship.post_code = '114-114'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('郵便番号はハイフンを含めて入力してください')
      end
      it 'prefecture_idが未選択だと登録できない' do
        @order_ship.prefecture_id = '1'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが存在しないと登録できない' do
        @order_ship.city = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが存在しないと登録できない' do
        @order_ship.house_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが存在しないと登録できない' do
        @order_ship.phone_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("電話番号を入力してください", "電話番号はハイフンを含まず10桁もしくは11桁で入力してください")
      end
      it 'phone_numberが9桁だと登録できない' do
        @order_ship.phone_number = '123456789'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号はハイフンを含まず10桁もしくは11桁で入力してください')
      end
      it 'phone_numberが12桁だと登録できない' do
        @order_ship.phone_number = '123456789123'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号はハイフンを含まず10桁もしくは11桁で入力してください')
      end
      it 'phone_numberが全角数字だと登録できない' do
        @order_ship.phone_number = '１２３４５６７８９０'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号はハイフンを含まず10桁もしくは11桁で入力してください')
      end
      it 'tokenが存在しないと登録できない' do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'user_idが存在しないと登録できない' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが存在しないと登録できない' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
