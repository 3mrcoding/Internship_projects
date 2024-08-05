const express = require("express");

const router = express.Router();

const usersController = require("../controllers/usersController");
const authController = require("../controllers/authController");

router.route("/me").get(authController.checkLogin, usersController.getUser);

module.exports = router;
