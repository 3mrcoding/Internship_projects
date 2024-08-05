const DB = require("../database");

exports.getUser = async (req, res, next) => {
  try {
    res.status(200).json({
      status: "Success",
      data: {
        email: req.user.email,
        id: req.user.user_id,
        role: req.user.role,
      },
    });
  } catch (error) {
    next(error); // Pass the error to the error handling middleware
  }
};
