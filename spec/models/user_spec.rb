require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_reading,first_name_reading,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailが@を含めば登録できること" do
        @user.email = "sample@sample.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上かつ半角英数字混合であれば登録できる" do
        @user.password = "000nnN"
        @user.password_confirmation = "000nnN"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email is invalid")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が入っていないと登録できないこと" do
        @user.email = "sample.sample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空だと登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できないこと" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと" do
        @user.last_name = "katakana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと" do
        @user.first_name = "namae"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_readingが空では登録できないこと" do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "first_name_readingが空では登録できないこと" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "last_name_readingが全角カタカナでないと登録できないこと" do
        @user.last_name_reading = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid")
      end
      it "first_name_readingが全角カタカナでないと登録できないこと" do
        @user.first_name_reading = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "birthdayが空では登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
