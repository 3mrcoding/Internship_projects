const dotenv = require("dotenv");
const app = require("./app");
const mongoose = require("mongoose");

const port = process.env.SERVER_PORT || 3000;

// Define Environment Variables
dotenv.config({ path: "./config.env" });

// Connecting Database
const dbUri = process.env.DATABASE.replace(
  "<password>",
  process.env.DATABASE_PASSWORD
);

mongoose.connect(dbUri).then(() => {
  console.log("DB CONNECTED SUCCESSFULLY");
});

//Connecting Server
const server = app.listen(port, () => {
  console.log(`Server Started Successfully on port ${port}`);
});
