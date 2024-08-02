const dotenv = require("dotenv");
dotenv.config();

const app = require("./app");

// define file of environment variables

const port = process.env.PORT;

// server starting
app.listen(port, () => {
  console.log(`App Starting on port ${port}`);
});
