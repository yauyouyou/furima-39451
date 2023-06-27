require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameは必須である' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailは必須である' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailは一意性である' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含む必要がある' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordは必須である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end

      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end

      it 'パスワードに全角文字が含まれている場合、登録できないこと' do
        @user.password = 'パスワード１２３'
        @user.password_confirmation = 'パスワード１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end

      it 'passwordとpassword（確認）は値の一致が必須である' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名字が必須であること' do
        @user.lastname_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname zenkaku can't be blank")
      end

      it 'お名前(全角)は、名前が必須であること' do
        @user.firstname_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname zenkaku can't be blank")
      end

      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.lastname_zenkaku = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname zenkaku は全角（漢字・ひらがな・カタカナ）で入力してください')
      end

      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.firstname_zenkaku = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname zenkaku は全角（漢字・ひらがな・カタカナ）で入力してください')
      end

      it 'お名前カナ(全角)は、名字が必須であること' do
        @user.lastname_kana_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana zenkaku can't be blank")
      end

      it 'お名前カナ(全角)は、名前が必須であること' do
        @user.firstname_kana_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana zenkaku can't be blank")
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.lastname_kana_zenkaku = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana zenkaku は全角（カタカナ）で入力してください')
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.firstname_kana_zenkaku = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana zenkaku は全角（カタカナ）で入力してください')
      end

      it '生年月日が必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
