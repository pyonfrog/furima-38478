require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  it "nicknameが存在しない場合は登録できないこと" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it "emailが存在しない場合は登録できないこと" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "passwordが存在しない場合は登録できないこと" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "passwordとpassword_confirmationが一致していないと登録できない" do
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "lastnameが存在しない場合は登録できないこと" do
    @user.lastname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Lastname can't be blank")
  end

  it "firstnameが存在しない場合は登録できないこと" do
    @user.firstname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Firstname can't be blank")
  end

  it "pronounce_lastnameが存在しない場合は登録できないこと" do
    @user.pronounce_lastname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Pronounce lastname can't be blank")
  end

  it "pronounce_firstnameが存在しない場合は登録できないこと" do
    @user.pronounce_firstname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Pronounce firstname can't be blank")
  end

  it "birthdayが存在しない場合は登録できないこと" do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it "重複したemailが存在する場合は登録できないこと" do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end

  it "passwordが5文字以下であれば登録できないこと" do
    password = "aa11"
    @user.password = password
    @user.password_confirmation = password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it "emailに@が含まれていない場合登録できない" do
    email = "aaabbb.jp"
    @user.email = email
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it "passwordは半角数字のみでは登録できない" do
    password = "000000"
    @user.password = password
    @user.password_confirmation = password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "passwordは半角英字のみでは登録できない" do
    password = "aaaaaa"
    @user.password = password
    @user.password_confirmation = password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "passwordは半角英数字以外が含まれると登録できない" do
    password = "aa11ｱｱ"
    @user.password = password
    @user.password_confirmation = password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "passwordは全角が含まれると登録できない" do
    password = "Ａaa111"
    @user.password = password
    @user.password_confirmation = password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "firstnameは半角では登録できない" do
    firstname = "ｼｹﾝ"
    @user.firstname = firstname
    @user.valid?
    expect(@user.errors.full_messages).to include('Firstname is invalid')
  end

  it "firstnameは英字では登録できない" do
    firstname = "TEST"
    @user.firstname = firstname
    @user.valid?
    expect(@user.errors.full_messages).to include('Firstname is invalid')
  end

  it "firstnameは数字では登録できない" do
    firstname = "１１１"
    @user.firstname = firstname
    @user.valid?
    expect(@user.errors.full_messages).to include('Firstname is invalid')
  end

  it "lastnameは半角では登録できない" do
    lastname = "ｼｹﾝ"
    @user.lastname = lastname
    @user.valid?
    expect(@user.errors.full_messages).to include('Lastname is invalid')
  end

  it "lastnameは英字では登録できない" do
    lastname = "TEST"
    @user.lastname = lastname
    @user.valid?
    expect(@user.errors.full_messages).to include('Lastname is invalid')
  end

  it "lastnameは数字では登録できない" do
    lastname = "１１１"
    @user.lastname = lastname
    @user.valid?
    expect(@user.errors.full_messages).to include('Lastname is invalid')
  end

  it "pronounce_firstnameは半角では登録できない" do
    pronounce_firstname = "ｼｹﾝ"
    @user.pronounce_firstname = pronounce_firstname
    @user.valid?
    expect(@user.errors.full_messages).to include('Pronounce firstname is invalid')
  end

  it "pronounce_firstnameはひらがなでは登録できない" do
    pronounce_firstname = "しけん"
    @user.pronounce_firstname = pronounce_firstname
    @user.valid?
    expect(@user.errors.full_messages).to include('Pronounce firstname is invalid')
  end

  it "pronounce_firstnameは漢字では登録できない" do
    pronounce_firstname = "試験"
    @user.pronounce_firstname = pronounce_firstname
    @user.valid?
    expect(@user.errors.full_messages).to include('Pronounce firstname is invalid')
  end

  it "pronounce_firstnameは数字では登録できない" do
    pronounce_firstname = "１１１"
    @user.pronounce_firstname = pronounce_firstname
    @user.valid?
    expect(@user.errors.full_messages).to include('Pronounce firstname is invalid')
  end

  it "pronounce_lastnameは半角では登録できない" do
    pronounce_lastname = "ｼｹﾝ"
    @user.pronounce_lastname = pronounce_lastname
    @user.valid?
    expect(@user.errors.full_messages).to include('Pronounce lastname is invalid')
  end

  it "pronounce_lastnameはひらがなでは登録できない" do
    pronounce_lastname = "しけん"
    @user.pronounce_lastname = pronounce_lastname
    @user.valid?
    expect(@user.errors.full_messages).to include('Pronounce lastname is invalid')
  end

  it "pronounce_lastnameは漢字では登録できない" do
    pronounce_lastname = "試験"
    @user.pronounce_lastname = pronounce_lastname
    @user.valid?
    expect(@user.errors.full_messages).to include('Pronounce lastname is invalid')
  end

  it "pronounce_lastnameは数字では登録できない" do
    pronounce_lastname = "１１１"
    @user.pronounce_lastname = pronounce_lastname
    @user.valid?
    expect(@user.errors.full_messages).to include('Pronounce lastname is invalid')
  end

end
