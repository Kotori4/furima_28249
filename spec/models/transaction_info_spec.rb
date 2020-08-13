require 'rails_helper'

RSpec.describe TransactionInfo, type: :model do
  describe "create" do
    before do
    @address = FactoryBot.build(:transaction_info)
    end

    describe '住所登録' do
      it "全ての項目が存在すれば登録できる" do
        expect(@address).to be_valid
      end
    end
    describe do
      it "Building_Unitが空でも登録できる" do
        @address.building_unit = ""
        expect(@address).to be_valid
      end
    end

    describe do
      it "郵便番号にハイフンがないと保存ができない" do
        @address.postal_code = "1230123"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid")
      end
    end
    describe do
      it "郵便番号は7桁でないと保存ができない" do
        @address.postal_code = "123-123"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid")
      end
    end
    describe do
      it "都道府県が未選択では保存ができない" do
        @address.prefecture_id = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
    describe do
      it "市区町村が空では保存ができない" do
        @address.city = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
    end
    describe do
      it "市区町村が半角文字では保存ができない" do
        @address.city = "Hiroshima"
        @address.valid?
        expect(@address.errors.full_messages).to include("City is invalid")
      end
    end
    describe do
      it "住所詳細が空では保存ができない" do
        @address.address_line = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Address line can't be blank")
      end
    end
    describe do
      it "電話番号は11桁以下でないと保存ができない" do
        @address.phone_number = "123456789012"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
    describe do
      it "電話番号はハイフンなしででないと保存ができない" do
        @address.phone_number = "123-4567-8901"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end


