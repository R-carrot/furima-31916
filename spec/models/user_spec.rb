require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '保存できる場合' do

      it 'nicknameとemailとpasswordとencrypted_passwordとlast_nameとfirst_nameとlast_name_katakanaとfirst_name_katakanaとbirth_dayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

    end

    context '保存できない場合' do

      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("性を入力してください")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end

      it 'last_name_katakanaが空では登録できないこと' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("性(カナ)を入力してください")
      end

      it 'first_name_katakanaが空では登録できないこと' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名(カナ)を入力してください")
      end

      it 'birth_dayが空では登録できないこと' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end

      it 'メールアドレスが@を含む必要があること' do
        @user.email = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end

      it 'パスワードが6文字以上での入力が必須であること' do
        @user.password = 'hoge1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password = "hoge11"
        @user.password_confirmation = "hoge22"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は全角(平仮名、カタカナ、漢字)での入力が必須であること' do
        @user.last_name = "family"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'ユーザー本名の振り仮名は、全角（カタカナ）での入力が必須であること' do
        @user.last_name_katakana = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = "パスワード"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが英語のみでは登録できないこと' do
        @user.password = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

    end
  end
end
