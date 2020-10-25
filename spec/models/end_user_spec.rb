require 'rails_helper'

RSpec.describe EndUser, type: :model do
  it "ユーザー名、メール、パスワードがある場合、有効である" do
  end_user = EndUser.new(
     name: "test",
     email: "test@example.com",
     password: "password",
     )
     expect(end_user).to be_valid
  end

  it "ユーザー名がない場合、無効である" do
  end_user = EndUser.new(
     name: nil,
     email: "test@example.com",
     password: "password",
     )
  end_user.valid?
   expect(end_user.errors[:name]).to include("can't be blank")
end
  it "メールアドレスがない場合、無効である" do
  end_user = EndUser.new(
     name: "test",
     email: nil,
     password: "password",
     )
  end_user.valid?
   expect(end_user.errors[:email]).to include("can't be blank")
end
  it "パスワードがない場合、無効である" do
  end_user = EndUser.new(
     name: "test",
     email: "test@example.com",
     password: nil,
     )
  end_user.valid?
   expect(end_user.errors[:password]).to include("can't be blank")
end
end
