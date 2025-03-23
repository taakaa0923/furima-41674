require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code を入力してください')
      end

      it 'prefectureが0だと登録できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture 0以外を選択してください')
      end

      it 'cityが空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('City を入力してください')
      end
      it '番地が空だと登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('House number を入力してください')
      end
      it '電話番号が空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number を入力してください')
      end
      it '郵便番号にハイフンが必須であること' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code は正しい形式で入力してください')
      end
      it '電話番号にはハイフンは不要であること' do
        @order_address.phone_number = '090-1234-1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は正しい形式で入力してください')
      end
      it '電話番号が9桁以下だと保存できない' do
        @order_address.phone_number = '08012345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は正しい形式で入力してください')
      end
      it '電話番号が12桁以上では保存できない' do
        @order_address.phone_number = '0901234567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number は正しい形式で入力してください')
      end
      it 'トークンが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Token を入力してください')
      end
      it 'user_idが空だと保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('User を入力してください')
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Item を入力してください')
      end
    end
  end
end
