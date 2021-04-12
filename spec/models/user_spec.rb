require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemailとpasswordとencrypted_passwordとlast_nameとfirst_nameとlast_name_katakanaとfirst_name_katakanaとbirth_dayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_katakanaが空では登録できないこと' do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
    end

    it 'first_name_katakanaが空では登録できないこと' do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end

    it 'birth_dayが空では登録できないこと' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスが@を含む必要があること' do
      @user.email = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが6文字以上での入力が必須であること' do
      @user.password = 'hoge1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Encrypted password is invalid")
    end

    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = "hoge11"
      # @user.encrypted_password = "hoge22"
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
  end
end
