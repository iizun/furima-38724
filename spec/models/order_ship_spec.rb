require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'post_code,prefecture_id,city,house_number,building_number,phone_number,token,user_id,item_idが存在すれば購入できる' do
        expect(@order_ship).to be_valid
      end
    end
    context '購入できない場合' do
      it 'post_codeが存在しないと登録できない' do
        @order_ship.post_code = ""
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと登録できない' do
        @order_ship.post_code = "1140021"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが前3桁でなければ登録できない' do
        @order_ship.post_code = "0021-0021"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが後4桁でなければ登録できない' do
        @order_ship.post_code = "114-114"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが未選択だと登録できない' do
        @order_ship.prefecture_id = '1'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが存在しないと登録できない' do
        @order_ship.city = ""
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが存在しないと登録できない' do
        @order_ship.house_number = ""
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが存在しないと登録できない' do
        @order_ship.phone_number = ""
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁だと登録できない' do
        @order_ship.phone_number = "123456789"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁だと登録できない' do
        @order_ship.phone_number = "123456789123"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字だと登録できない' do
        @order_ship.phone_number = "１２３４５６７８９０"
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが存在しないと登録できない' do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが存在しないと登録できない' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが存在しないと登録できない' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
