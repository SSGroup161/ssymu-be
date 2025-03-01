const {
    getLogin,
    getUsersById,
    getUsersBySub,
    getUsersByEmail,
    postUsers,
    putUsers,
    putPictureProfile,
    checkEmailSub,
    verifyAccount,
    forgotPassword,
} = require("../model/authModel");
const { hash, verify } = require("../helper/passwordHash");
const jwt = require("jsonwebtoken");
const nodemailer = require("nodemailer");
require("dotenv").config();
const { v4: uuidv4 } = require("uuid");
const xss = require("xss");
const cloudinary = require("../config/cloudinary");
const { OAuth2Client } = require("google-auth-library");

const secretKey = process.env.SECRET_KEY;

const transporter = nodemailer.createTransport({
    service: "gmail",
    host: "smtp.gmail.com",
    secure: true,
    port: 465,
    auth: {
        user: process.env.EMAILGMAIL,
        pass: process.env.PASSGMAIL,
    },
    connectionTimeout: 10000,
});

const htmlMessage = (name, data) => `<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
        />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap"
            rel="stylesheet"
        />
        <title>Level Up Beaute</title>
    </head>

    <body
        style="
            margin: auto;
            font-family: 'Roboto', sans-serif;
            text-align: center;
            color: #444341;
            margin: 4rem 0rem;
            padding: 0rem 2rem;
            background-color: #f5edea;
        "
    >
        <div style="background-color: white">
            <div
                style="
                    display: flex;
                    justify-content: space-between;
                    width: 100%;
                "
            >
                <img
                    src="https://res.cloudinary.com/dixxtnquz/image/upload/v1715584437/Levelup%20Beaute/Profile/Logo_-_Landscape2_2_1_ecbgmu.png"
                    alt="LogoLevelUP"
                    style="margin: 10px 20px"
                />
            </div>
            <img
                src="https://res.cloudinary.com/dixxtnquz/image/upload/v1715583398/Levelup%20Beaute/Profile/iconAsset_hdinrv.png"
                alt="asetIcon"
                width="150"
            />
            <br />
            <br />
            <h1 style="margin: 0">Konfirmasi Verifikasi Email</h1>
            <br />
            <h1 style="font-size: 16px; font-weight: 500; margin: 0">
                Halo ${name} !
            </h1>
            <p style="font-size: 14px; font-weight: 400; margin: 8px 0">
                Untuk melanjutkan akun Anda sebelum login, harap melakukan
                verifikasi terlebih dahulu untuk memastikan bahwa itu benar
                Anda.
            </p>
            <p style="font-size: 14px; font-weight: 400; margin: 8px 0">
                Jika Anda merasa tindakan ini bukan Anda yang melakukan, mohon
                abaikan email ini.
            </p>
            <p style="font-size: 14px; font-weight: 400; margin: 16px 0">
                Untuk konfirmasi silahkan klik dibawah ini.
            </p>
            <a href="${
                process.env.DOMAIN
            }/auth/verify/?user=${encodeURIComponent(JSON.stringify(data))}">
            <button
                style="
                    width: 10rem;
                    height: 3rem;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    color: white;
                    background-color: #916c4f;
                "
            >
                Verify
            </button>
            </a>
            <br />
            <a
                href=${process.env.DOMAIN}
                style="
                    text-decoration: none;
                    color: #916c4f;
                    font-size: 14px;
                    margin-top: 10px;
                    display: inline-block;
                "
                >levelupbeaute.id</a
            >
            <p style="font-size: 12px; margin: 10px 20px">
                © 2023 Level Up Beaute part of SS Group. All rights reserved.
            </p>
            <br />
        </div>
    </body>
</html>
`;

const htmlMessageForgot = (name, data) => `<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
        />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap"
            rel="stylesheet"
        />
        <title>Level Up Beaute</title>
    </head>

    <body
        style="
            margin: auto;
            font-family: 'Roboto', sans-serif;
            text-align: center;
            color: #444341;
            margin: 4rem 0rem;
            padding: 0rem 2rem;
            background-color: #f5edea;
        "
    >
        <div style="background-color: white">
            <div
                style="
                    display: flex;
                    justify-content: space-between;
                    width: 100%;
                "
            >
                <img
                    src="https://res.cloudinary.com/dixxtnquz/image/upload/v1715584437/Levelup%20Beaute/Profile/Logo_-_Landscape2_2_1_ecbgmu.png"
                    alt="LogoLevelUP"
                    style="margin: 10px 20px"
                />
            </div>
            <img
                src="https://res.cloudinary.com/dixxtnquz/image/upload/v1715583398/Levelup%20Beaute/Profile/iconAsset_hdinrv.png"
                alt="asetIcon"
                width="150"
            />
            <br />
            <br />
            <h1 style="margin: 0">Konfirmasi Verifikasi Email</h1>
            <br />
            <h1 style="font-size: 16px; font-weight: 500; margin: 0">
                Halo ${name} !
            </h1>
            <p style="font-size: 14px; font-weight: 400; margin: 8px 0">
                Untuk melanjutkan perubahan password Anda, silahkan klik dibawah ini.
            </p>
            <p style="font-size: 14px; font-weight: 400; margin: 8px 0">
                Jika Anda merasa tindakan ini bukan Anda yang melakukan, mohon
                abaikan email ini.
            </p>
            <p style="font-size: 14px; font-weight: 400; margin: 16px 0">
                Untuk konfirmasi silahkan klik dibawah ini.
            </p>
            <a href="${
                process.env.DOMAIN
            }/auth/change/?user=${encodeURIComponent(JSON.stringify(data))}">
            <button
                style="
                    width: 10rem;
                    height: 3rem;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    color: white;
                    background-color: #916c4f;
                "
            >
                Change Password Here
            </button>
            </a>
            <br />
            <a
                href=${process.env.DOMAIN}
                style="
                    text-decoration: none;
                    color: #916c4f;
                    font-size: 14px;
                    margin-top: 10px;
                    display: inline-block;
                "
                >levelupbeaute.id</a
            >
            <p style="font-size: 12px; margin: 10px 20px">
                © 2023 Level Up Beaute part of SS Group. All rights reserved.
            </p>
            <br />
        </div>
    </body>
</html>
`;

const AuthController = {
    login: async (req, res, next) => {
        try {
            const { email, password } = req.body;

            if (!email || !password) {
                return res.status(400).json({
                    status: 400,
                    message: "input email and password required",
                });
            }

            const dataUsers = await getLogin({ email });

            if (!dataUsers[0].email_verified) {
                console.log(dataUsers.email_verified);
                return res.status(400).json({
                    status: 400,
                    message:
                        "Please verify your account first, please check your email.",
                });
            }

            if (dataUsers && dataUsers.length > 0) {
                const storedPassword = dataUsers[0].password;

                if (
                    typeof storedPassword === "string" &&
                    typeof password === "string"
                ) {
                    const isPasswordValid = await verify(
                        storedPassword,
                        password
                    );
                    if (isPasswordValid) {
                        const token = jwt.sign(
                            {
                                id: dataUsers[0].id,
                                email: email,
                                name: dataUsers[0].name,
                                sub: false,
                            },
                            secretKey,
                            { expiresIn: "7d" }
                        );

                        return res.status(200).json({
                            status: 200,
                            message: "Login Successfully",
                            token,
                            data: dataUsers[0],
                        });
                    } else {
                        return res
                            .status(401)
                            .json({ status: 401, message: "Wrong password" });
                    }
                } else {
                    return res.status(500).json({
                        status: 500,
                        message:
                            "Internal server error: Invalid password format",
                    });
                }
            } else {
                return res.status(404).json({
                    status: 404,
                    message: "Email not found",
                });
            }
        } catch (err) {
            console.error(err.message);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    getToken: async (req, res, next) => {
        try {
            const { sub, name, email } = req.body;

            const dataUsers = await getLogin({ email });

            const token = jwt.sign(
                {
                    id: dataUsers[0].id,
                    email: email,
                    name,
                    sub,
                },
                secretKey,
                { expiresIn: "24h" }
            );

            return res.status(200).json({
                status: 200,
                message: "Get token Successfully",
                token,
                data: dataUsers[0],
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    loginGoogle: async (req, res, next) => {
        res.header(
            "Access-Control-Allow-Origin",
            process.env.LOCALHOST,
            process.env.DOMAIN
        );
        res.header("Access-Control-Allow-Credentials", "true");
        res.header("Referrer-Policy", "no-referrer-when-downgrade");
        const redirectURL = process.env.API + "/oauth";

        const oAuth2Client = new OAuth2Client(
            process.env.CLIENT_ID,
            process.env.CLIENT_SECRET,
            redirectURL
        );

        const authorizeUrl = oAuth2Client.generateAuthUrl({
            access_type: "offline",
            scope: `${process.env.USERINFO_PROFILE} ${process.env.USERINFO_EMAIL} openid `,
            prompt: "consent",
        });

        res.json({ url: authorizeUrl });
    },

    getDataById: async (req, res, next) => {
        try {
            const { id } = req.params;
            const dataUsers = await getUsersById(id);

            res.status(200).json({
                status: 200,
                message: "Get data users by id success",
                dataUsers,
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    getDataBySub: async (req, res, next) => {
        try {
            const { id } = req.params;
            const dataUsers = await getUsersBySub(id);

            res.status(200).json({
                status: 200,
                message: "Get data users by sub success",
                dataUsers,
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    postData: async (req, res, next) => {
        try {
            const {
                sub,
                name,
                email,
                password,
                notelp,
                address,
                picture_google,
            } = req.body;
            const picture = req.file;
            const uuid = uuidv4();

            console.log("post data");
            console.log(
                sub,
                name,
                email,
                password,
                notelp,
                address,
                picture_google
            );

            const existingUser = await checkEmailSub(email);

            if (existingUser.exists) {
                if (sub && existingUser.sub) {
                    return res.status(200).json({
                        message: "Login without postdata success",
                    });
                } else if (sub && !existingUser.sub) {
                    return res.status(400).json({
                        message: "Email already exists, please login",
                    });
                } else if (!sub) {
                    return res.status(400).json({
                        message:
                            "Email already exists, login or enter another email",
                    });
                }
            }

            if (!name.trim() || !email.trim() || (!password.trim() && !sub)) {
                return res.status(400).json({
                    status: 400,
                    message: "field input required",
                });
            }

            if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
                return res.status(400).json({
                    status: 400,
                    message: "Invalid email format",
                });
            }

            let resultt;
            if (!sub) {
                resultt = await cloudinary.uploader.upload(picture.path, {
                    use_filename: true,
                    folder: "Levelup Beaute/Profile",
                });
            }

            let hashedPassword;
            if (!sub) {
                hashedPassword = await hash(password);
            }

            console.log("data");
            const data = {
                id: uuid,
                sub: sub || null,
                name: xss(name),
                email: xss(email),
                password: sub ? null : xss(hashedPassword),
                notelp: xss(notelp) || null,
                address: xss(address) || null,
                picture: sub ? picture_google : resultt.secure_url || null,
                public_id: sub ? null : resultt.public_id || null,
                email_verified: sub ? true : false,
            };

            console.log(data);
            const result = await postUsers(data);
            console.log(result);
            res.status(200).json({
                status: 200,
                say: `Hello ${name}!`,
                message: "Registration success",
                data,
            });
            if (!sub) {
                const mailOptions = {
                    from: {
                        name: "no-reply",
                        address: process.env.EMAILCOMPANY,
                    },
                    to: xss(email),
                    subject: "Verifikasi akun Level Up Beaute Anda",
                    text: `Halo ${name}, have a nice day!`,
                    html: htmlMessage(name, data),
                };

                console.log("emailcompany", process.env.EMAILCOMPANY);

                transporter.sendMail(mailOptions, (error, info) => {
                    if (error) {
                        console.error("Gagal mengirim email: ", error);
                        return res.status(500).json({
                            status: 500,
                            message: "Failed to send email",
                        });
                    } else {
                        console.log("Email terkirim: ", info.response);
                    }
                });
            }
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    putData: async (req, res, next) => {
        try {
            const { id } = req.params;
            const { name, notelp, address } = req.body;

            console.log("PUT request received");
            console.log("Request body:", req.body);
            console.log("Request params:", req.params);

            const dataUsers = await getUsersById(id);

            console.log("Fetched user data:", dataUsers);

            if (id !== dataUsers.id) {
                return res
                    .status(400)
                    .json({ status: 400, message: "ID Not Found" });
            }

            const data = {
                sub: dataUsers.sub,
                email: dataUsers.email,
                password: dataUsers.password,
                name: name ? xss(name) : dataUsers.name,
                notelp: notelp ? xss(notelp) : dataUsers.notelp,
                address: address ? xss(address) : dataUsers.address,
                picture: dataUsers.picture,
                public_id: dataUsers.public_id,
                id,
            };

            const result = await putUsers(data, id);
            console.log("Database update result:", result);

            delete data.id;

            res.status(200).json({
                status: 200,
                message: "Update data users success",
                data,
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    putDataBySub: async (req, res, next) => {
        try {
            const { id } = req.params;
            const { name, notelp, address } = req.body;

            console.log("PUT request received");
            console.log("Request body:", req.body);
            console.log("Request params:", req.params);

            const dataUsers = await getUsersBySub(id);

            console.log("Fetched user data:", dataUsers);

            if (id !== dataUsers.sub) {
                return res
                    .status(400)
                    .json({ status: 400, message: "ID Not Found" });
            }

            const data = {
                sub: dataUsers.sub,
                email: dataUsers.email,
                password: dataUsers.password,
                name: name ? xss(name) : dataUsers.name,
                notelp: notelp ? xss(notelp) : dataUsers.notelp,
                address: address ? xss(address) : dataUsers.address,
                picture: dataUsers.picture,
                public_id: dataUsers.public_id,
                id,
            };

            const result = await putUsers(data, dataUsers.id);
            console.log("Database update result:", result);

            delete data.id;

            res.status(200).json({
                status: 200,
                message: "Update data users success",
                data,
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    putPicture: async (req, res, next) => {
        try {
            const { id } = req.params;
            const dataUsers = await getUsersById(id);
            const picture = req.file;

            if (!dataUsers) {
                return res
                    .status(404)
                    .json({ status: 404, message: "User not found" });
            }

            console.log(picture);

            if (!picture) {
                return res
                    .status(400)
                    .json({ status: 400, message: "No picture uploaded" });
            }

            console.log("Fetched user data:", dataUsers);

            if (id !== dataUsers.id) {
                return res
                    .status(400)
                    .json({ status: 400, message: "ID Not Found" });
            }

            const resultt = await cloudinary.uploader.upload(picture.path, {
                use_filename: true,
                folder: "Levelup Beaute/Profile",
            });

            if (dataUsers.public_id) {
                await cloudinary.uploader.destroy(dataUsers.public_id);
            }

            const data = {
                picture: resultt.secure_url,
                public_id: resultt.public_id,
            };

            const result = await putPictureProfile(data, id);
            console.log("Database update result:", result);

            res.status(200).json({
                status: 200,
                message: "Update data picture success",
                data,
            });
        } catch (err) {
            console.error("Error updating picture:", err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    verifyEmail: async (req, res, next) => {
        try {
            const { id } = req.params;

            const dataUsers = await getUsersById(id);

            if (dataUsers.email_verified) {
                return res.status(200).json({
                    status: 200,
                    message: "Email already verify",
                });
            }

            const result = await verifyAccount(true, id);
            console.log(result);
            res.status(200).json({
                status: 200,
                message: "Email Verification Successful!",
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    forgotPass: async (req, res, next) => {
        try {
            const { id } = req.params;
            const { new_password } = req.body;
            const dataUsers = await getUsersById(id);
            console.log("dataUsers", dataUsers);
            console.log(dataUsers.password);
            console.log(new_password);

            const isPasswordValid = await verify(
                dataUsers.password,
                new_password
            );

            if (!new_password.trim()) {
                return res.status(400).json({
                    status: 400,
                    message: "field input required",
                });
            }

            if (isPasswordValid) {
                return res.status(400).json({
                    status: 400,
                    message:
                        "Try another password, your password is the same as before",
                });
            }

            const hashedPassword = await hash(new_password);

            const data = {
                new_password: xss(hashedPassword),
                id,
            };

            const result = await forgotPassword(data);
            console.log(result);
            res.status(200).json({
                status: 200,
                message: "Password changed successfully!",
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    requestForgot: async (req, res, next) => {
        try {
            const { email } = req.body;

            if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
                return res.status(400).json({
                    status: 400,
                    message: "Invalid email format",
                });
            }

            const dataUsers = await getUsersByEmail(email);

            if (!dataUsers) {
                return res.status(400).json({
                    status: 400,
                    message: "Email not found",
                });
            }

            const name = dataUsers.name;
            console.log(dataUsers);

            if (dataUsers.sub) {
                return res.status(400).json({
                    status: 400,
                    message:
                        "You cannot change your Google account password here, you can change it in your Google account",
                });
            }

            const data = {
                id: dataUsers.id,
                sub: dataUsers.sub,
                email: dataUsers.email,
            };

            const mailOptions = {
                from: {
                    name: "no-reply",
                    address: process.env.EMAILCOMPANY,
                },
                to: xss(email),
                subject: "Change Password Confirmation",
                text: `Halo ${name}, have a nice day!`,
                html: htmlMessageForgot(name, data),
            };

            console.log("emailcompany", process.env.EMAILCOMPANY);

            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    console.error("Gagal mengirim email: ", error);
                    return res.status(500).json({
                        status: 500,
                        message: "Failed to send email",
                    });
                } else {
                    console.log("Email terkirim: ", info.response);
                }
            });
            res.status(200).json({
                status: 200,
                message: "Please check your email!",
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },
};

module.exports = AuthController;
