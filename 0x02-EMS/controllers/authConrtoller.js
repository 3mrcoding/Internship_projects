const DB = require("../database");
const bcrypt = require("bcrypt");

exports.PassHash = async (pass) => {
  const salt = bcrypt.genSalt();
  return bcrypt.hash(pass, salt);
};
