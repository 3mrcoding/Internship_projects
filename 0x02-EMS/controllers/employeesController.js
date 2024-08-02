const DB = require("../database");

exports.getAllEmployees = async (req, res, next) => {
  const employees = await DB.query("SELECT * FROM employees");

  res.status(200).json({
    status: "Success",
    Results: employees[0].length,
    data: employees[0],
  });
};
