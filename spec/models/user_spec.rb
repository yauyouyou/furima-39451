require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
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
    end

    it 'emailは@を含む必要がある' do
    end

    it 'passwordは必須である' do
    end

    it 'passwordは6文字以上での入力が必須である' do
    end

    it 'passwordは半角英数字混合での入力が必須である' do
    end

    it 'passwordとpassword（確認）は値の一致が必須である' do
    end
  end
end
