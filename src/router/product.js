var express = require("express");
var router = express.Router();
const {
    getDataById,
    getData,
    getDataByCategory,
} = require("./../controller/productController");

router.get("/:id", getDataById);
router.get("/category/:id", getDataByCategory);
router.get("/", getData);

module.exports = router;
