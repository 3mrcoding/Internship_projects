const User = require("../models/userModel");

exports.getAllUsers = async (req, res, next) => {
  const users = await User.find();

  res.status(200).json({
    status: "Success",
    Results: users.length,
    Data: {
      users,
    },
  });
};

exports.getUserById = async (req, res, next) => {
  const user = await User.findById(req.params.id);

  if (!user) return next(new Error("User Not Found!"));

  res.status(200).json({
    status: "Success",
    Data: {
      user,
    },
  });
};

exports.deleteUserById = async (req, res, next) => {
  const user = await User.findByIdAndDelete(req.params.id);

  if (!user) return next(new Error("User Not Found!"));

  res.status(204).json({
    status: "Success",
  });
};

exports.getMe = async (req, res, next) => {
  const user = await User.findById(req.user.id);

  res.status(200).json({
    status: "Success",
    Data: {
      user,
    },
  });
};
