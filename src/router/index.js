const express = require("express");
const router = express.Router();
const Product = require("./product");
const Article = require("./article");

router.use("/api/v1/product", Product);
router.use("/api/v1/article", Article);

module.exports = router;
