require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー管理機能" do
   
    it "全て入力すれば登録できること" do
      expect(@user).to be_valid
    end

    it "ニックネームが必須であること" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは、半角英数字混合での入力が必須であること(英語)" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "パスワードは、半角英数字混合での入力が必須であること(数字)" do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
      @user.password_confirmation = '111aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること(名字)" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角で入力して下さい")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること(名前)" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角で入力して下さい")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名字)" do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角で入力して下さい")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名前)" do
      @user.last_name = 'n'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角で入力して下さい")
    end

    it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名字)" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
    end

    it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名前)" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(名字)" do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(名前)" do
      @user.last_name_kana = 'ん'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
    end

    it "生年月日が必須であること" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end