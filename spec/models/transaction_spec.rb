require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '購入手続きの実行' do
    before do
      @address = FactoryBot.build(:address)
    end

    # describe '購入手続き' do
    #   it "全ての項目が存在すれば登録できる" do
    #     expect(@address).to be_valid
    #   end
    # end

  end
end