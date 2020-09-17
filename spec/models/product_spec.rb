require 'rails_helper'
 
RSpec.describe Product, type: :model do
before do
    @product = FactoryBot.build(:product)
    @product.image =fixture_file_upload('ゴリラ.jpeg')
  end
describe '商品出品' do
  
  context '商品出品がうまくいくとき' do
    it "nameとexplanation、genre_idとstatus_id、burden_idとarea_id、days_idとvalueが存在すれば登録できる" do
      expect(@product).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do
    it "nameが空だと登録できない" do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "explanationが空では登録できない" do
      @product.explanation = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Explanation can't be blank")
    end
    it "genre_idが空では登録できない" do
      @product.genre_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Genre can't be blank")
    end
    it "status_idが空なら登録できない" do
      @product.status_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Status can't be blank")
    end
    it "burden_idが空なら登録できない" do
      @product.burden_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Burden can't be blank")
    end
    it "area_idが空なら登録できない" do
      @product.area_id= ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Area can't be blank")
    end
    it "days_idが空なら登録できない" do
      @product.days_id= ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Days can't be blank")
    end
    it "valueが空なら登録できない" do
      @product.value = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Value can't be blank")
    end
    it 'imageが空では保存できないこと' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("image can't be blank")
    end
  end
end
end