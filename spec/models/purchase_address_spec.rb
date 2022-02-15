require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '購入ができる場合' do
      it '全ての項目が入力されていれば購入できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは入力されていないくても購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '購入ができない場合' do
      it 'post_codeが入力されていない場合購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに半角数字で3桁、4桁にハイフンで分けて入力されていない場合購入できない' do
        @purchase_address.post_code = '１２-34567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeにハイフンが入力されていないと購入できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idに1が選択されている場合購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが入力されていない場合購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが入力されていない場合購入できない' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'tel_numberが入力されていない場合購入できない' do
        @purchase_address.tel_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberは9桁以下を入力しても購入できない' do
        @purchase_address.tel_number = 123456789
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel number is ten or eleven figures")
      end
      it 'tel_numberは12桁以上を入力しても購入できない' do
        @purchase_address.tel_number = 123456789012
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel number is ten or eleven figures")
      end
      it 'tel_numberに半角数字以外が入力されても購入できない' do
        @purchase_address.tel_number = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel number is ten or eleven figures")
      end
      it 'tokenが入力されていない場合購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userと紐付いていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐付いていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
