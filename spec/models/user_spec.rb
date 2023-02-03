require 'rails_helper'

RSpec.describe User, type: :model do
  it "name, email, password, password_confirmationが存在すれば登録できること" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "nameが存在しない場合は登録できないこと" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "emailが存在しない場合は登録できないこと" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "passwordが存在しない場合は登録できないこと" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "passwordが存在しても、password_confirmationが存在しない場合は登録できないこと" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

  it "重複したemailが存在する場合は登録できないこと" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("はすでに存在します")
  end

  it "passwordが7文字以上であれば登録できること" do
    user = build(:user, password: "0000000", password_confirmation: "0000000")
    user.valid?
    expect(user).to be_valid
  end

  it "passwordが6文字以下であれば登録できないこと" do
    user = build(:user, password: "000000", password_confirmation: "000000")
    user.valid?
    expect(user.errors[:password]).to include("は7文字以上で入力してください")
  end

end
