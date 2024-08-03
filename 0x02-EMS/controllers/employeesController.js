const DB = require("../database");

exports.getAllEmployees = async (req, res, next) => {
  try {
    const employees = await DB.query("SELECT * FROM employees");

    if (employees[0].length === 0) return next(new Error("No employees !!"));

    res.status(200).json({
      status: "Success",
      Results: employees[0].length,
      data: employees[0],
    });
  } catch (err) {
    next(err);
  }
};

exports.getEmploye = async (req, res, next) => {
  try {
    const { id } = req.params;
    const employe = await DB.query(`SELECT * FROM employees WHERE id = ?`, [
      [id],
    ]);

    if (!id) {
      return next(new Error("No ID provided for the deletion."));
    }
    if (employe[0].length === 0) {
      return next(new Error("No employee found with the provided ID."));
    }

    res.status(200).json({
      status: "Success",
      data: employe[0],
    });
  } catch (error) {
    next(error); // Pass the error to the error handling middleware
  }
};

exports.updateEmployee = async (req, res, next) => {
  const { id } = req.params;
  const updateData = req.body;

  if (!id || Object.keys(updateData).length === 0) {
    return next(new Error("No ID or data provided for the update."));
  }

  try {
    // Build dynamic query
    const fields = [];
    const values = [];

    for (const [key, value] of Object.entries(updateData)) {
      fields.push(`${key} = ?`);
      values.push(value);
    }

    const query = `UPDATE employees SET ${fields.join(", ")} WHERE id = ?`;
    values.push(id); // Add ID at the end for the WHERE clause

    const [result] = await DB.query(query, values);

    if (result.affectedRows === 0) {
      return next(
        new Error("No employee found with the provided ID or no changes made.")
      );
    }

    res.status(200).json({
      status: "Success",
      message: "Employee updated successfully",
    });
  } catch (error) {
    next(error);
  }
};

exports.deleteEmployee = async (req, res, next) => {
  const { id } = req.params;

  if (!id) {
    return next(new Error("No ID provided for the deletion."));
  }

  try {
    const [result] = await DB.query(`DELETE FROM employees WHERE id = ?`, [id]);

    if (result.affectedRows === 0) {
      return next(new Error("No employee found with the provided ID."));
    }

    res.status(204).json({
      status: "Success",
      message: "Employee deleted successfully",
    });
  } catch (error) {
    next(error);
  }
};
