const express = require("express");
const morgan = require("morgan");
const app = express();
const employeRouter = require("./routes/employeRouter");

app.use(express.json());
app.use(morgan("dev"));

app.use("/api/v1/employees", employeRouter);

// Error Handling
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});

module.exports = app;
