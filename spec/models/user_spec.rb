require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "has valid attributes" do
      @user = User.create(
        first_name: 'test',
        last_name: 'test',
        password: 'test12345',
        password_confirmation: 'test12345',
        email: 'test@test.com'
      )
      expect(@user).to be_valid
    end

    it "is invalid if no first name" do
      @user = User.create(
        first_name: nil,
        last_name: 'test',
        password: 'test12345',
        password_confirmation: 'test12345',
        email: 'test@test.com'
      )
      expect(@user).to_not be_valid
    end

    it "is invalid if no last name" do
      @user = User.create(
        first_name: 'test',
        last_name: nil,
        password: 'test12345',
        password_confirmation: 'test12345',
        email: 'test@test.com'
      )
      expect(@user).to_not be_valid
    end

    it "is invalid if no password" do
      @user = User.create(
        first_name: 'test',
        last_name: 'test',
        password: nil,
        password_confirmation: 'test12345',
        email: 'test@test.com'
      )
      expect(@user).to_not be_valid
    end

    it "is invalid if no password confirmation" do
      @user = User.create(
        first_name: 'test',
        last_name: 'test',
        password: 'test12345',
        password_confirmation: nil,
        email: 'test@test.com'
      )
      expect(@user).to_not be_valid
    end

    it "is invalid if no email" do
      @user = User.create(
        first_name: 'test',
        last_name: 'test',
        password: 'test12345',
        password_confirmation: 'test12345',
        email: nil
      )
      expect(@user).to_not be_valid
    end

    context "verifying email inputs" do
      it "is invalid if email is already taken: case sensitive" do
        @user = User.create(
          first_name: 'test', 
          last_name: 'test', 
          password: 'test12345', 
          password_confirmation: 'test12345', 
          email: 'test3'
        )
        @user2 = User.create(
          first_name: 'test', 
          last_name: 'test', 
          password: 'test12345', 
          password_confirmation: 'test12345', 
          email: 'test3'
        )
        expect(@user2.errors.full_messages[0]).to eql("Email has already been taken")
        expect(@user2).to_not be_valid
      end

      it "is invalid if email is already taken: regardless of case" do
        @user = User.create(
          first_name: 'test', 
          last_name: 'test', 
          password: 'test12345', 
          password_confirmation: 'test12345', 
          email: 'test4'
        )
        @user2 = User.create(
          first_name: 'test', 
          last_name: 'test', 
          password: 'test12345', 
          password_confirmation: 'test12345', 
          email: 'TeSt4'
        )
        expect(@user2.errors.full_messages[0]).to eql("Email has already been taken")
        expect(@user2).to_not be_valid
      end
    end

    context "verifying password inputs" do
      it "is invalid if password and password confirmation do not match" do
        @user = User.create(first_name: 'test', last_name: 'test', password: 'test1', password_confirmation: 'tEsT', email: 'test2')

        expect(@user.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
        expect(@user).to_not be_valid
      end

      it "is invalid if password has under 5 characters" do
        @user = User.create(first_name: 'test', last_name: 'test', password: 'test', password_confirmation: 'test', email: 'test3')
        expect(@user.errors.full_messages[0]).to eql("Password is too short (minimum is 8 characters)")
        expect(@user).to_not be_valid
      end
    end

  end

  describe ".authenticate_with_credentials" do
    it "should return nil if the user cannot be authenticated" do
      user1 = User.create(
          first_name: "Braden",
          last_name: "Clokie",
          email: "braden.clokie@gmail.com",
          password: "password",
          password_confirmation: "password",
        )
      expect(
        User.authenticate_with_credentials("braden.clokie@gmail.com", "wrong"),
      ).to be_nil
    end

    it "should return the user if the user can be authenticated" do
      user1 = User.create(
          first_name: "Braden",
          last_name: "Clokie",
          email: "braden.clokie@gmail.com",
          password: "password",
          password_confirmation: "password",
        )
      expect(
        User.authenticate_with_credentials("braden.clokie@gmail.com", "password"),
      ).to be_truthy.and have_attributes(email: "braden.clokie@gmail.com")
    end

    it "save the users email after removing whitespace and lowering the case" do
      user1 =
        User.create(
          first_name: "Braden",
          last_name: "Clokie",
          email: "braden.clokie@gmail.com",
          password: "password",
          password_confirmation: "password",
        )
      expect(
        User.authenticate_with_credentials(
          "  braden.clokie@gmail.com  ",
          "password",
        ),
      ).to be_truthy.and have_attributes(email: "braden.clokie@gmail.com")
    end
  end

end