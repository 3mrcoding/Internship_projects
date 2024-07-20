const express = require("express");

const router = express.Router();

const userController = require("../controllers/userController");
const authController = require("../controllers/authController");

router
  .route("/")
  .get(
    authController.protectRoute,
    authController.restrictedTo("admin"),
    userController.getAllUsers
  );

router
  .route("/id/:id")
  .get(
    authController.protectRoute,
    authController.restrictedTo("admin"),
    userController.getUserById
  )
  .delete(
    authController.protectRoute,
    authController.restrictedTo("admin"),
    userController.deleteUserById
  );

router.route("/me").get(authController.protectRoute, userController.getMe);

module.exports = router;
