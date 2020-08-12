require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe '購入手続き' do
      it "全ての項目が存在すれば登録できる" do
        expect(@purchase).to be_valid
      end
    end

end
end