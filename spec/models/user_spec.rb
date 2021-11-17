require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "It must be created with a password and password_confirmation fields" do
      @user = User.new(name: "Matt", email: "test@test.com", password: "abc123", password_confirmation: "abc123")
      @user.save!
      expect(@user).to be_present
    end

    it "should not save without matching passwords" do
      @user = User.new(name: "Matt", email: "test@test.com", password: "abc123", password_confirmation: "123")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should not save with password = nil" do
      @user = User.new(name: "Matt", email: "test@test.com", password: nil, password_confirmation: "abc123")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not save when confirmationPassword = nil" do
      @user = User.new(name: "Matt", email: "test@test.com", password: "abc123", password_confirmation: "")
      @user.save
      expect(@user.id).not_to be_present
    end

    it "should have a unique email" do
      @user1 = User.new(name: "Matt", email: "test@test.com", password: "abc123", password_confirmation: "abc123")
      @user2 = User.new(name: "Matt", email: "test@test.com", password: "abc123", password_confirmation: "abc123")
      @user1.save
      @user2.save
      expect(@user2.id).not_to be_present
    end

    it "should have a unique email thats case sensitive" do
      @user1 = User.new(name: "Matt", email: "test@test.com", password: "abc123", password_confirmation: "abc123")
      @user2 = User.new(name: "Matt", email: "TEST@TEST.com", password: "abc123", password_confirmation: "abc123")
      @user1.save
      @user2.save
      expect(@user2.id).not_to be_present
    end

    it "should not save when all fields arent filled out" do
      @user1 = User.new(name: "", email: "test@test.com", password: "abc123", password_confirmation: "abc123")
      @user2 = User.new(name: "Matt", email: nil, password: "abc123", password_confirmation: "abc123")
      @user3 = User.new(name: "Matt", email: "test@test.com", password: nil, password_confirmation: "abc123")
      @user1.save
      @user2.save
      @user3.save
      expect(@user1.id).to be nil
      expect(@user2.id).to be nil
      expect(@user3.id).to be nil
    end

    it "The password must have a minimum length when a user account is being created." do
      @user1 = User.new(name: "Matt", email: "test@test.com", password: "a", password_confirmation: "a")
      @user1.save
      expect(@user1.id).not_to be_present
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do 
      @email = "test@test.com"
      @password = "abc123"
      user = User.create(name:"Matt", email: @email, password: @password, password_confirmation: @password)
    end

    describe "test(:each)" do 
      it "If a visitor types in a few spaces before and/or after their email address they should still be authenticated successfully" do
        user = User.authenticate_with_credentials("    test@test.com    ", @password)
        expect(user).to be_a(User)
      end
    end

    describe "test(:each)" do 
      it "should return a nil when given an invalid username" do
        user = User.authenticate_with_credentials("asd123@asd123.com", @password)
        expect(user).to eq(nil)
      end
    end

    describe "test(:each)" do 
      it "should return a nil when given an invalid password" do
        user = User.authenticate_with_credentials(@email, "123abc")
        expect(user).to eq(nil)
      end
    end

    describe "test(:each)" do 
      it "should return a user when given an valid case-insensitive username" do
        user = User.authenticate_with_credentials("tEsT@TEST.com", "abc123")
        expect(user).to be_a(User)
      end
    end

    describe "test(:each)" do 
      it "should return a nil when given an valid case-insensitive password" do
        user = User.authenticate_with_credentials("tEsT@TEST.com", "ABC123")
        expect(user).to eq(nil)
      end
    end

  end

end