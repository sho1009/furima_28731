require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが6文字以下で登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "first_nameが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "last_nameが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "read_firstが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "read_lastが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが7文字以上であれば登録できない" do
        @user.nickname = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it"emailに＠が含まれていないと登録できない" do
        user = build(:user, email: "@")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英字のみなら登録できない" do
        user = build(:user, password: "aaaaaaa")
        user.valid?
        expect(user.errors[:password]).to include("は不正な値です")
      end
      it "passwordが半角数字のみなら登録できない" do
        user = build(:user, password: "1111111")
        user.valid?
        expect(user.errors[:password]).to include("は不正な値です")
      end
      it "first_nameが空なら登録できない" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end
      it "last_nameが空なら登録できない" do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end
      it "first_readが空なら登録できない" do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end
      it "last_readが空なら登録できない" do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end
      it "birthが空なら登録できない" do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("を入力してください")
      end
  
    end
  end