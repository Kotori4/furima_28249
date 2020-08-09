require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "create" do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.user_id = @user.id
      @item.image = fixture_file_upload('public/image/test_image.png')
    end
    
    describe '商品登録' do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    describe 'ユーザー新規登録' do
      it "画像が空だと保存ができない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "アイテム名が空だと保存ができない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "アイテム詳細が空だと保存ができない" do
        @item.item_detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end
      it "アイテムカテゴリを未選択だと保存ができない" do
        @item.item_category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "アイテムカテゴリを未選択だと保存ができない" do
        @item.item_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it "配送料の負担者を未選択だと保存ができない" do
        @item.covered_shipping_by_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Covered shipping by can't be blank")
      end
      it "発送元の地域を未選択だと保存ができない" do
        @item.ship_from_location_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from location can't be blank")
      end
      it "発送までの日数を未選択だと保存ができない" do
        @item.days_til_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days til ship can't be blank")
      end
      it "販売価格が空だと保存ができない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300円未満だと保存ができない" do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が10,000,000を超える金額だと保存ができない" do
        @item.price = 10000000
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
