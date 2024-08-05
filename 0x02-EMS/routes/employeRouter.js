const express = require("express");

const router = express.Router();

const employeesController = require("../controllers/employeesController");
const authController = require("../controllers/authController");

router
  .route("/")
  .get(
    authController.checkLogin,
    authController.restrictedTo("admin"),
    employeesController.getAllEmployees
  );
router
  .route("/id/:id")
  .get(
    authController.checkLogin,
    authController.restrictedTo("admin"),
    employeesController.getEmploye
  )
  .patch(
    authController.checkLogin,
    authController.restrictedTo("admin"),
    employeesController.updateEmployee
  )
  .delete(
    authController.checkLogin,
    authController.restrictedTo("admin"),
    employeesController.deleteEmployee
  );

module.exports = router;
