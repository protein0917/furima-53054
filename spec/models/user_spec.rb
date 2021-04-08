require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー管理機能" do
   
    it "全て入力すれば登録できること" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
    end

    it "ニックネームが必須であること" do
      user = User.new(name: "", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it "メールアドレスが必須であること" do
      user = User.new(name: "test", email: "", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      user = User.new(name: "test1", email: "aaa111", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user = User.new(name: "test2", email: "aaa111", password: "aaa222", password_confirmation: "aaa222", first_name: "い", last_name: "を", first_name_kana: "イ", last_name_kana: "ヲ", birthday: "2021-02-02")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it "メールアドレスは、@を含む必要があること" do
      user = User.new(name: "test", email: "testtest", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      user = User.new(name: "test", email: "test@test", password: "", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      user = User.new(name: "test", email: "test@test", password: "aaa11", password_confirmation: "aaa11", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは、半角英数字混合での入力が必須であること(英語)" do
      user = User.new(name: "test", email: "test@test", password: "aaaaaa", password_confirmation: "aaaaaa", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "パスワードは、半角英数字混合での入力が必須であること(数字)" do
      user = User.new(name: "test", email: "test@test", password: "111111", password_confirmation: "111111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "パスワードは、確認用を含めて2回入力すること" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "111aaa", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること(名字)" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name 全角で入力して下さい")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること(名前)" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name 全角で入力して下さい")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名字)" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "a", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name 全角で入力して下さい")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名前)" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "n", first_name_kana: "ア", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name 全角で入力して下さい")
    end

    it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名字)" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
    end

    it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名前)" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(名字)" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "a", last_name_kana: "ン", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(名前)" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "n", birthday: "2020-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
    end

    it "生年月日が必須であること" do
      user = User.new(name: "test", email: "test@test", password: "aaa111", password_confirmation: "aaa111", first_name: "あ", last_name: "ん", first_name_kana: "ア", last_name_kana: "ン", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end