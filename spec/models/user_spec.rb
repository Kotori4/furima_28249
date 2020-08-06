require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "名前のカナが存在し尚且つカタカタであれば登録できる" do
        @user.last_name_reading = "ヤマムラ"
        @user.first_name_reading = "ハナコ"
        expect(@user).to be_valid
      end
      it "名前が存在すれば登録できる" do
        @user.last_name = "山むラ"
        @user.first_name = "はナ子"
        expect(@user).to be_valid
      end
      it "パスワードが半角英数字の6文字以上であれば登録できる" do
        @user.password = "test123"
        expect(@user).to be_valid
      end
    end

    describe 'ユーザー新規登録' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaa1"
        @user.password_confirmation = "aaaa1" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに全角がふくまれていると登録できない" do
        @user.password = "aaa123５"
        @user.password_confirmation = "aaa123５" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters and number.")
      end
      it "passwordに数字が含まれていないと登録できない" do
        @user.password = "aaaaaaaaa"
        @user.password_confirmation = "aaaaaaaaa" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters and number.")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = "" 
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がないと登録ができない" do
        @user.email = "aaaaaa.aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "ユーザ本名の苗字が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザ本名の名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザ本名の苗字が半角では登録できない" do
        @user.last_name = "yamamura"
        @user.first_name = "はなこ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "ユーザ本名の名前が半角では登録できない" do
        @user.last_name = "やまむら"
        @user.first_name = "hanako"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "ユーザ苗字のフリガナが空では登録できない" do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "ユーザの名前のフリガナが空では登録できない" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "ユーザ本名の苗字が半角では登録できない" do
        @user.last_name_reading = "yamamura"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters.")
      end
      it "ユーザの名前カナが半角では登録できない" do
        @user.first_name_reading = "hanako"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
      end
      it "ユーザの誕生日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

