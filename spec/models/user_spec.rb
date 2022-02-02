require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'first_nameが入力されていなければ登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it 'last_nameが入力されていなければ登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it 'last_nameが全角でなければ登録できない' do
        @user.last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it 'f_first_nameが入力されていなければ登録できない' do
        @user.f_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("F first name can't be blank")
      end
      it 'f_last_nameが入力されていなければ登録できない' do
        @user.f_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("F last name can't be blank")
      end
      it 'f_first_nameは全角カタカナでなければ登録できない' do
        @user.f_first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("F first name 全角カタカナを使用してください")
      end
      it 'f_last_nameは全角カタカナでなければ登録できない' do
        @user.f_last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("F last name 全角カタカナを使用してください")
      end
      it 'nicknameが入力されていなければ登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが入力されていなければ登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが他のユーザーと重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが入力されていなければ登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが半角英数をともに含むものでなければ登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = "11aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
      end
      it 'passwordに全角文字が含まれると登録できない' do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa456'
        @user.password_confirmation = 'aaa4567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'dobが入力されていなければ登録できない' do
        @user.dob = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Dob can't be blank")
      end
    end
  end
end

