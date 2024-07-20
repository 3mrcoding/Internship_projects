const User = require("../models/userModel");
const jwt = require("jsonwebtoken");

// Assign Login Token by using User's ID
const signToken = (id) => {
  return jwt.sign({ id }, process.env.SECRET);
};

// Signing up function
exports.signup = async (req, res, next) => {
  const { userName, email, password, passwordConfirm } = req.body;
  const newUser = await User.create({
    userName,
    email,
    password,
    passwordConfirm,
  });

  if (!newUser) return next(new Error("There is an Error creating new User!"));
  const token = signToken(newUser._id);
  res.status(201).json({
    status: "Success",
    token,
  });
};

exports.login = async (req, res, next) => {
  const { email, password } = req.body;
  // Check if user enterd the email and password
  if (!email || !password) return next(new Error("Enter Email and Password"));

  // quering the User
  const user = await User.findOne({ email }).select("+password");

  // Checking if User Exists & Password is correct
  if (!user || !(await user.checkPassword(password, user.password)))
    return next(new Error("Wronge email or password"));

  const token = signToken(user._id);
  res.status(201).json({
    status: "Success",
    token,
  });
};

exports.protectRoute = async (req, res, next) => {
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  )
    token = req.headers.authorization.split(" ")[1];
  if (!token) return next(new Error("Please Login First"));

  const decoded = jwt.verify(token, process.env.SECRET);
  const currectUser = await User.findById(decoded.id);

  req.user = currectUser;
  next();
};

exports.restrictedTo = (...role) => {
  return (req, res, next) => {
    if (!role.includes(req.user.role))
      return next(new Error("User is not authorized to enter this URL"));
    next();
  };
};
