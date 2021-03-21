require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birth_dayがあれば登録できる'do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name は全角文字を使用してください')
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name は全角文字を使用してください')
    end

    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", 'Family name kana は全角カタカナ文字を使用してください')
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana は全角カタカナ文字を使用してください')
    end

    it 'family_nameが漢字、平仮名、カタカナ以外では登録できないこと' do
      @user.family_name = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name は全角文字を使用してください')
    end

    it 'first_nameが漢字、平仮名、カタカナ以外では登録できないこと' do
      @user.first_name = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は全角文字を使用してください')
    end

    it 'family_name_kanaが全角カタカナ以外では登録できないこと' do
      @user.family_name_kana = '1185つくﾛｳ鎌倉幕府Yeah'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana は全角カタカナ文字を使用してください')
    end

    it 'first_name_kanaが全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = '1185つくﾛｳ鎌倉幕府Yeah'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana は全角カタカナ文字を使用してください')
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '@が含まれていないと登録できない' do
      @user.email = 'aaaaaa.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailがあっては登録できない' do
      @user.email = ''
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは数字のみでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordは英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordは全角では登録できない' do
      @user.password = '１１１ｓｆｈ'
      @user.password_confirmation = '１１１ｓｆｈ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordとpassword_confirmationが６文字以上であれば登録できる' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'cba321'
      @user.password_confirmation = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが５文字以下では登録できない' do
      @user.password = 'ab123'
      @user.password_confirmation = 'ab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは英字と数字の両方が含まれていないと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end