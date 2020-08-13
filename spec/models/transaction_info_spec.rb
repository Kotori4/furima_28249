require 'rails_helper'

RSpec.describe TransactionInfo, type: :model do
  describe "購入画面" do
    before do
    @address = FactoryBot.build(:transaction_info)
    end

    describe '住所登録' do
      it "全ての項目が存在すれば登録できる" do
        expect(@address).to be_valid
      end
    end
    describe '住所登録' do
      it "Building_Unitが空でも登録できる" do
        @address.building_unit = ""
        expect(@address).to be_valid
      end
    end

    describe '住所登録' do
      it "郵便番号にハイフンがないと保存ができない" do
        @address.postal_code = "1230123"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid")
      end
    end
    describe '住所登録' do
      it "郵便番号は7桁でないと保存ができない" do
        @address.postal_code = "123-123"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid")
      end
    end
    describe '住所登録' do
      it "電話番号は11桁以下でないと保存ができない" do
        @address.phone_number = "123456789012"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
    describe '住所登録' do
      it "電話番号はハイフンなしででないと保存ができない" do
        @address.phone_number = "123-4567-8901"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end


