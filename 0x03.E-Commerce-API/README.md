API Endpoints
User Authentication
POST /api/auth/register - Register a new user
POST /api/auth/login - Login an existing user
User Management
GET /api/users - Get a list of users (admin only)
GET /api/users/:id - Get a specific user by ID (admin only)
DELETE /api/users/:id - Delete a user (admin only)
Product Management
POST /api/products - Create a new product (admin only)
GET /api/products - Get a list of products
GET /api/products/:id - Get a specific product by ID
PATCH /api/products/:id - Update a product (admin only)
DELETE /api/products/:id - Delete a product (admin only)

User Profile
GET /api/users/me - Get the current user's profile
PATCH /api/users/me - Update the current user's profile
PATCH /api/users/forgetpassword - send email to user with reset link
PATCH /api/users//resetpassword/:token - reset user's password
