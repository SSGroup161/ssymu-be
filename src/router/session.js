var express = require("express");
var router = express.Router();
const {
    postData,
    putData,
    getSession,
} = require("../controller/sessionController");

router.post("/", postData);
router.put("/:id", putData);
router.get("/:id", getSession);

module.exports = router;
