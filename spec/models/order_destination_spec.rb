require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_destination = FactoryBot.build(:order_destination, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '購入情報が保存される場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '購入情報が保存されない場合' do
      it 'postcodeが空では保存されない' do
        @order_destination.postcode = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeにハイフンが含まれないと保存されない' do
        @order_destination.postcode = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'postcodeが全角だと保存されない' do
        @order_destination.postcode = '１２３-４５６７'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1だと保存されない' do
        @order_destination.prefecture_id = '1'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存されない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存されない' do
        @order_destination.block = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Block can't be blank")
      end
      it 'telが空だと保存されない' do
        @order_destination.tel = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telにハイフンが含まれると保存されない' do
        @order_destination.tel = '090-1234-5678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが全角では保存されない' do
        @order_destination.tel = '０９０１２３４５６７８'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが9桁以下では保存されない' do
        @order_destination.tel = '090123456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁以上では保存されない' do
        @order_destination.tel = '090123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空では保存されない' do
        @order_destination.token = nil
        binding.pry
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'itemが紐づいていないと保存されない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐づいていないと保存されない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
