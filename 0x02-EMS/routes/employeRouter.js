const express = require("express");

const router = express.Router();

const employeesController = require("../controllers/employeesController");

router.route("/").get(employeesController.getAllEmployees);

module.exports = router;
