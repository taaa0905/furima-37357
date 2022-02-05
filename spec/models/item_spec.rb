require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品ができる場合' do
      it '全ての項目が入力されている場合' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない場合' do
      it 'product_nameが入力されていなければ出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Product name can't be blank")
      end
      it 'explanationが入力されていなければ出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Explanation can't be blank")
      end
      it 'category_idの1を選択されている場合出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'condition_idの1を選択されている場合出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it 'shipping_charge_idの1を選択されている場合出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping charge can't be blank")
      end
      it 'prefeture_idの1を選択されている場合出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'packaging_day_idの1を選択されている場合出品できない' do
        @item.packaging_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Packaging day can't be blank")
      end
      it 'priceが入力されていなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it 'priceに半角数字以外が入力されている場合出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      it 'priceに300未満しか入力されていない場合出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it 'priceに9999999を超えた数値を入力された場合出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
      it 'imageが選択されていない場合出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it 'userが紐づいていない場合出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("User must exist")
      end
    end
  end
end
