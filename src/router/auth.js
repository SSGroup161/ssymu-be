var express = require("express");
var router = express.Router();
const {
    login,
    postData,
    loginGoogle,
    putData,
    putDataBySub,
    verifyEmail,
    getDataById,
    getDataBySub,
    forgotPass,
    requestForgot,
    putPicture,
    getToken,
} = require("../controller/authController");
const upload = require("../helper/uploadCloudinary");

router.post("/login", login);
router.post("/req/token", getToken);
router.post("/login/google", loginGoogle);
router.post("/", upload.single("picture"), postData);
router.put("/picture/:id", upload.single("picture"), putPicture);
router.put("/user/id/:id", putData);
router.put("/user/sub/:id", putDataBySub);
router.put("/verify/:id", verifyEmail);
router.put("/forgot/:id", forgotPass);
router.get("/user/id/:id", getDataById);
router.get("/user/sub/:id", getDataBySub);
router.post("/user/req/", requestForgot);

module.exports = router;
