# Secure User Authentication - FUTUREINTERN - TASK 1

Implement a user authentication system with secure login and registration functionality. Users should be able to sign up for an account, log in securely, and access protected routes only after successful authentication. Use standard mechanisms to handle password hashing, session management, and user role-based access control.
Protected routes should restrict unauthorized access to sensitive functionalities.

## Technology Stack

    Backend Framework: Node.js with Express.js
    Database: MongoDB
    Authentication: JWT (JSON Web Tokens)
    ORM/ODM: Mongoose (for MongoDB interaction)

## APIs

User Management

    GET /api/users - Get a list of users (admin only)
    GET /api/users/:id - Get a specific user by ID (admin only)
    DELETE /api/users/:id - Delete a user (admin only)

User Authentication

    POST /api/auth/register - Register a new user
    POST /api/auth/login - Login an existing user

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.
