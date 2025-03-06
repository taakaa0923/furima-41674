require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end
  it 'is valid with valid attributes' do
    expect(@item).to be_valid
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name,image,price,text,category_id,sales_status_id,shipping_fee_status_id,prefecture_id,scheduled_delivery_idが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では保存できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'textが空では保存できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空では保存できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'sales_status_idが空では保存できない' do
        @item.sales_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it 'shipping_fee_status_idが空では保存できない' do
        @item.shipping_fee_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'scheduled_delivery_idが空では保存できない' do
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが10000000以上では保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it 'カテゴリーの情報が0だと登録できない' do
        @item.category_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品の状態についての情報が0だと登録できない' do
        @item.sales_status_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank", 'Sales status is not a number')
      end
      it '配送料の負担についての情報が0だと登録できない' do
        @item.shipping_fee_status_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", 'Shipping fee status is not a number')
      end
      it '発送元の地域についての情報が0だと登録できない' do
        @item.prefecture_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it '発送までの日数についての情報が0だと登録できない' do
        @item.scheduled_delivery_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", 'Scheduled delivery is not a number')
      end
    end
  end
end
