require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "user_name,email,passwordとpassword_confirmation,last_name,first_name,last_name_ruby,first_name_ruby,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "user_name が空だと登録できない" do
        @user.user_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name can't be blank")
      end
      it "email が空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailがDBに存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "email は@を含まないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "password が空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordと確認用password が一致しなければ登録できない" do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password が英字だけでは登録できない" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it "password が数字だけでは登録できない" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it "password は5文字以下では登録できない" do
        @user.password = 'aaaa0'
        @user.password_confirmation = 'aaaa0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "last_name が空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_name に半角英字を含むと登録できない" do
        @user.last_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "last_name に半角数字を含むと登録できない" do
        @user.last_name = "1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "last_name に半角カナを含むと登録できない" do
        @user.last_name = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "last_name に記号を含むと登録できない" do
        @user.last_name = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_name が空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_name に半角英字を含むと登録できない" do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "first_name に半角数字を含むと登録できない" do
        @user.first_name = "1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "first_name に半角カナを含むと登録できない" do
        @user.first_name = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "first_name に記号を含むと登録できない" do
        @user.first_name = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_name_ruby が空では登録できない" do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
      end
      it "last_name_ruby に半角英字を含むと登録できない" do
        @user.last_name_ruby = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby 全角カタカナを使用してください")
      end
      it "last_name_ruby に半角数字を含むと登録できない" do
        @user.last_name_ruby = "1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby 全角カタカナを使用してください")
      end
      it "last_name_ruby に半角カナを含むと登録できない" do
        @user.last_name_ruby = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby 全角カタカナを使用してください")
      end
      it "last_name_ruby に記号を含むと登録できない" do
        @user.last_name_ruby = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby 全角カタカナを使用してください")
      end
      it "last_name_ruby に全角漢字を含むと登録できない" do
        @user.last_name_ruby = "阿"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby 全角カタカナを使用してください")
      end
      it "last_name_ruby に全角かなを含むと登録できない" do
        @user.last_name_ruby = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby 全角カタカナを使用してください")
      end
      it "first_name_ruby が空では登録できない" do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end
      it "first_name_ruby に半角英字を含むと登録できない" do
        @user.first_name_ruby = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby 全角カタカナを使用してください")
      end
      it "first_name_ruby に半角数字を含むと登録できない" do
        @user.first_name_ruby = "1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby 全角カタカナを使用してください")
      end
      it "first_name_ruby に半角カナを含むと登録できない" do
        @user.first_name_ruby = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby 全角カタカナを使用してください")
      end
      it "first_name_ruby に記号を含むと登録できない" do
        @user.first_name_ruby = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby 全角カタカナを使用してください")
      end
      it "first_name_ruby に全角漢字を含むと登録できない" do
        @user.first_name_ruby = "阿"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby 全角カタカナを使用してください")
      end
      it "first_name_ruby に全角かなを含むと登録できない" do
        @user.first_name_ruby = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby 全角カタカナを使用してください")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
