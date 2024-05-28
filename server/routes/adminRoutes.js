// server\routes\adminRoutes.js
const express = require("express");
const router = express.Router();
const {
  getUsers,
  updateUserRole,
  deleteUser,
} = require("../controllers/adminController");
const authenticateJWT = require("../middleware/authMiddleware");

router.use(authenticateJWT);

router.get("/users", getUsers);
router.put("/users/:userId/role", updateUserRole); // Route for updating role
router.delete("/users/:userId", deleteUser);

module.exports = router;
