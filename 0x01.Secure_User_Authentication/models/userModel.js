const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const validator = require("validator");

// Define User Scheme
const userScheme = new mongoose.Schema(
  {
    userName: {
      type: String,
      required: [true, "Please enter a valid username"],
      unique: true,
    },
    email: {
      type: String,
      required: [true, "Please Enter a valid E-mail"],
      unique: true,
      validate: [validator.isEmail, "Please provide a valid e-mail"],
    },
    role: {
      type: String,
      default: "user",
      enum: ["admin", "user"],
    },
    password: {
      type: String,
      required: [true, "Please enter a valid password"],
      select: false,
    },
    passwordConfirm: {
      type: String,
      required: [true, "Please confirm your password"],
      // checking Password is the same as PasswordConfirm
      validate: {
        validator: function (el) {
          return el === this.password;
        },
        message: "Passwords are not the same!",
      },
    },
    photo: String,
  },
  { versionKey: false },
  { collection: "users" }
);

// Hashing the password and deleting PasswordCofnirm field.
userScheme.pre("save", async function (next) {
  if (!this.isModified("password")) return next();

  this.password = await bcrypt.hash(this.password, 12);
  console.log(this.passwordConfirm);
  this.passwordConfirm = undefined;
  next();
});

// Instance Method to check Password for Login
userScheme.methods.checkPassword = async function (enteredPass, storedPass) {
  return await bcrypt.compare(enteredPass, storedPass);
};

// Creating Model
const User = mongoose.model("User", userScheme);

module.exports = User;
