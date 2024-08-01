const app = require("./app");
const dotenv = require("dotenv");

// define file of environment variables
dotenv.config({ path: "./.env" });

const port = process.env.PORT;

// server starting
app.listen(port, () => {
  console.log(`App Starting on port ${port}`);
});
