# Employee Management System

## Overview

Welcome to the **Employee Management System**! This is a Node.js application designed to provide a RESTful API for managing employees. The system leverages:

- **Express.js** as the web framework
- **MySQL** for the database
- **JSON Web Tokens (JWT)** for authentication

## Features

- **User Authentication and Authorization**: Secure access using JWT
- **CRUD Operations**: Create, Read, Update, and Delete employees
- **Role-Based Access**: Restricted routes based on user roles

## Requirements

- **Node.js** (version 14 or higher)
- **MySQL** (version 8 or higher)
- **npm** (version 6 or higher)

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/employee-management-system.git
   ```

2. **Install Dependencies**

   ```bash
   npm install
   ```

3. **Set Up Environment Variables**

   Create a `.env` file in the root directory and add the following variables:

   ```
   DATABASE_HOST=your_database_host
   DATABASE_USER=your_database_user
   DATABASE_PASS=your_database_password
   DATABASE_NAME=your_database_name
   SECRET=your_jwt_secret
   ```

4. **Start the Application**
   ```bash
   npm start
   ```

## API Endpoints

### Authentication

- **POST** `/api/v1/auth/login` - Login with email and password
- **POST** `/api/v1/auth/signup` - Sign up with email and password

### Employees

- **GET** `/api/v1/employees` - Get all employees (Admin only)
- **POST** `/api/v1/employees` - Create a new employee (Admin only)
- **GET** `/api/v1/employees/:id` - Get an employee by ID (Admin only)
- **PATCH** `/api/v1/employees/:id` - Update an employee (Admin only)
- **DELETE** `/api/v1/employees/:id` - Delete an employee (Admin only)

### Users

- **GET** `/api/v1/users/me` - Get the current user's profile

## Error Handling

The application employs centralized error handling middleware to catch and manage errors. Error responses are formatted in JSON with a standardized structure.

## Code Organization

The project structure is as follows:

- **app.js**: Main application file
- **controllers/**: Functions to handle requests and responses
- **database/**: Database connection and query functions
- **models/**: Database schema definitions
- **routes/**: Route definitions for the API
- **utils/**: Utility functions for authentication and error handling

## Security

- **Authentication and Authorization**: Handled using JWT
- **Password Security**: Passwords are hashed and stored securely with bcrypt

## Contributing

We welcome contributions! Please submit a pull request with your changes and include a brief description of your additions or fixes.

## License

This project is licensed under the **MIT License**. See the [LICENSE](./LICENSE) file for details.
