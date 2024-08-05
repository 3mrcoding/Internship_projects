const DB = require("../database");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const PassHash = async (pass) => {
  const salt = await bcrypt.genSalt();
  return await bcrypt.hash(pass, salt);
};

const signToken = (id) => {
  return jwt.sign({ id }, process.env.SECRET);
};

// Signing up function
exports.signup = async (req, res, next) => {
  const { email, password, passwordConfirm } = req.body;
  if (password !== passwordConfirm)
    return next(new Error("Password isn't matched!"));

  const hasedPass = await PassHash(password);
  const newUser = await DB.query(
    `INSERT INTO users (email, password) VALUES (?,?)`,
    [email, hasedPass]
  );

  if (newUser[0].length === 0) return next(new Error("This user is not Exist"));
  const token = signToken(newUser[0].insertId);
  res.status(201).json({
    status: "Success",
    token,
  });
};

exports.login = async (req, res, next) => {
  const { email, password } = req.body;
  // Check if user enterd the email and password
  if (!email || !password) return next(new Error("Enter Email and Password"));

  // quering the User
  const user = await DB.query(`SELECT * FROM users WHERE email = ?`, [email]);

  // Checking if User Exists & Password is correct
  if (
    user[0].length === 0 ||
    !((await PassHash(password)) !== user[0][0].password)
  )
    return next(new Error("Wronge email or password"));
  const token = signToken(user[0][0].user_id);
  res.status(201).json({
    status: "Success",
    token,
  });
};

exports.checkLogin = async (req, res, next) => {
  let token;
  // 1) check if the user is loged in.
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  )
    token = req.headers.authorization.split(" ")[1];
  if (!token) return next(new Error("Please Login to complete!"));

  // 2) check if the token is verfiyed.
  const decodedObj = jwt.verify(token, process.env.SECRET, (err, decoded) => {
    if (err) return next(new Error("Invalid Token!"));
    return decoded;
  });

  // 3) check if the user is still in the database.
  const currentUser = await DB.query(`SELECT * FROM users WHERE user_id = ?`, [
    decodedObj.id,
  ]);
  if (currentUser[0].length === 0)
    return next(new Error("This user is not Exist"));

  req.user = currentUser[0][0];
  next();
};

exports.restrictedTo = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role))
      return next(new Error("This User Can't Access this URL!"));
    next();
  };
};
