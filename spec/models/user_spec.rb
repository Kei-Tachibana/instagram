require 'rails_helper'

describe User do
  describe '#create' do
    #name, email, password, password_confirmationでcreateできるか
    it "is valid with name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    #name が空
    it "is invalid without name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    #email が空
    it "is invalid without email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    #password が空
    it "is invalid without password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    #passwordがあってもpassword_confirmation が空
     it "is invalid without password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    #emailが重複
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    #name が１６文字
    it "is invalid with a name that has more than 16 characters " do
      user = build(:user, name: "aaaaabbbbbcccccd")
      user.valid?
      expect(user.errors[:name][0]).to include("is too long")
    end

    #name が１５文字
    it "is valid with a name that has less than 15 characters " do
      user = build(:user, name: "aaaaabbbbbccccc")
      expect(user).to be_valid
    end

    #password が５文字
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end
