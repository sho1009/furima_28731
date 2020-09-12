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
      it "emailに＠が含まれていないと登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
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
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end
      it "passwordが半角数字のみなら登録できない" do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end
      it "first_nameが空なら登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空なら登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "read_firstが空なら登録できない" do
        @user.read_first= ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first は全角カタカナで入力して下さい。")
      end
      it "read_lastが空なら登録できない" do
        @user.read_last = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last は全角カタカナで入力して下さい。")
      end
      it "birthが空なら登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it "first_nameが半角英字のみなら登録できない" do
        @user.first_name = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameが半角数字のみなら登録できない" do
        @user.first_name = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが半角英字のみなら登録できない" do
        @user.last_name = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name gitは全角で入力してください。")
      end
      it "last_nameが半角数字のみなら登録できない" do
        @user.last_name = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name gitは全角で入力してください。")
      end
      it "read_firstが半角英字のみなら登録できない" do
        @user.read_first = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first は全角カタカナで入力して下さい。")
      end
      it "read_firstが半角数字のみなら登録できない" do
        @user.read_first = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first は全角カタカナで入力して下さい。")
      end
      it "read_lastが半角英字のみなら登録できない" do
        @user.read_last = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last は全角カタカナで入力して下さい。")
      end
      it "read_lastが半角数字のみなら登録できない" do
        @user.read_last = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last は全角カタカナで入力して下さい。")
      end
    end
  end
end