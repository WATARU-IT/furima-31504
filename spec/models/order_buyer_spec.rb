require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe 'create' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_buyer = FactoryBot.build(:order_buyer, user_id:user.id, item_id:item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '全ての値があれば登録できること' do
        expect(@order_buyer).to be_valid
      end

      it 'building_nameがなくても登録できること' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeがなければ登録できないこと' do
        @order_buyer.post_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにはハイフンが必要であること' do
        @order_buyer.post_code = '11111111'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Post code はハイフンをつけて入力してください')
      end

      it 'cityがなければ登録できないこと' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'addressがなければ登録できないこと' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberがなければ登録できないこと' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberにハイフンは不要であること' do
        @order_buyer.phone_number = '123-4567-8901'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number はハイフンなし、 かつ１２桁以上では登録できません')
      end

      it 'phone_numberは１２桁以上では登録できないこと' do
        @order_buyer.phone_number = '1234567890123'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number はハイフンなし、 かつ１２桁以上では登録できません')
      end


      it 'phone_numberは英字のみでは登録できないこと' do
        @order_buyer.phone_number = 'abcdefghijkl'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number 半角数字以外では登録できません')
      end

      it 'phone_numberは英数字混合では登録できないこと' do
        @order_buyer.phone_number = '123456abcdef'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number 半角数字以外では登録できません')
      end

      it 'phone_numberは全角数字では登録できないこと' do
        @order_buyer.phone_number = '１２３４５６７８９０１２'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone number 半角数字以外では登録できません')
      end

      it 'prefecture_idがなければ登録できないこと' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'tokenが空では登録できないこと' do
        @order_buyer.token = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @order_buyer.user_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @order_buyer.item_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
