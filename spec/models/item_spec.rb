require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameがなければ登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'textが空では登録できないこと' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'categoryが空では登録できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it 'categoryの1を選択すると登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'statusが空では登録できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Status is not a number')
    end

    it 'statusの1を選択すると登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it 'shippingがなければ登録できないこと' do
      @item.shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping is not a number')
    end

    it 'shippingの1を選択すると登録できないこと' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping must be other than 1')
    end

    it 'prefectureがなければ登録できないこと' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end

    it 'prefectureの1を選択すると登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'shipping_dayがなければ登録できないこと' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day is not a number')
    end

    it 'shipping_dayの1を選択すると登録できないこと' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
    end

    it 'priceがなければ登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end

    it 'priceが、¥299以下だと登録できないこと' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが、¥10,000,000以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceは半角数字でなければ登録できないこと' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceは全角文字では登録できないこと' do
      @item.price = '１１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceは英数字混合では登録できないこと' do
      @item.price = 'aaa111'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
