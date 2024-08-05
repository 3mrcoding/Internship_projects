const express = require("express");
const morgan = require("morgan");
const app = express();
const employeRouter = require("./routes/employeRouter");
const userRouter = require("./routes/userRouter");
const authRouter = require("./routes/authRouter");

app.use(express.json());
app.use(morgan("dev"));

app.use("/api/v1/employees", employeRouter);
app.use("/api/v1/users", userRouter);
app.use("/api/v1/auth", authRouter);

// Error Handling
app.use((err, req, res, next) => {
  res.status(500).json({
    status: "Error",
    message: err.message,
  });
});

module.exports = app;
