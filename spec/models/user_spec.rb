require 'rails_helper'

RSpec.describe User, type: :model do
  it "nicknameが存在しない場合は登録できないこと" do
    user = FactoryBot.build(:user, nickname: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Nickname can't be blank")
  end

  it "emailが存在しない場合は登録できないこと" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Email can't be blank")
  end

  it "passwordが存在しない場合は登録できないこと" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Password can't be blank")
  end

  it "passwordとpassword_confirmationが一致していないと登録できない" do
    user = FactoryBot.build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "lastnameが存在しない場合は登録できないこと" do
    user = FactoryBot.build(:user, lastname: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Lastname can't be blank")
  end

  it "firstnameが存在しない場合は登録できないこと" do
    user = FactoryBot.build(:user, firstname: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Firstname can't be blank")
  end

  it "pronounce_lastnameが存在しない場合は登録できないこと" do
    user = FactoryBot.build(:user, pronounce_lastname: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Pronounce lastname can't be blank")
  end

  it "pronounce_firstnameが存在しない場合は登録できないこと" do
    user = FactoryBot.build(:user, pronounce_firstname: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Pronounce firstname can't be blank")
  end

  it "birthdayが存在しない場合は登録できないこと" do
    user = FactoryBot.build(:user, birthday: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Birthday can't be blank")
  end

  it "重複したemailが存在する場合は登録できないこと" do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end

  it "passwordが5文字以下であれば登録できないこと" do
    password = "aa11"
      user = FactoryBot.build(:user, password: password, password_confirmation: password)
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

end
