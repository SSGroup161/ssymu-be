const {
    getSession,
    postSession,
    putSession,
} = require("../model/loginSessionModel");
const { v4: uuidv4 } = require("uuid");

const getFormattedDate = () => {
    const now = new Date();
    const options = {
        timeZone: "Asia/Jakarta",
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
        hour12: true,
    };
    const formatter = new Intl.DateTimeFormat("en-US", options);
    const [
        { value: month },
        ,
        { value: day },
        ,
        { value: year },
        ,
        { value: hour },
        ,
        { value: minute },
        ,
        { value: second },
        ,
        { value: period },
    ] = formatter.formatToParts(now);

    return `${day}${month}${year}.${hour}:${minute}:${second}${period.toUpperCase()}`;
};

const LoginSession = {
    getSession: async (req, res, next) => {
        try {
            const { id } = req.params;
            const dataUsers = await getSession(id);

            if (dataUsers) {
                res.status(200).json({
                    status: 200,
                    message: "Get data session by id_user success",
                    dataUsers,
                });
            } else {
                return res.status(404).json({
                    status: 404,
                    message: "Session not found",
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

    postData: async (req, res, next) => {
        try {
            const { id_user, name, token } = req.body;
            const uuid = uuidv4();
            const ip =
                req.headers["x-forwarded-for"] ||
                req.connection.remoteAddress ||
                req.socket.remoteAddress ||
                (req.connection.socket
                    ? req.connection.socket.remoteAddress
                    : null);

            console.log("post data");
            console.log(id_user, name, token, ip);

            const data = {
                id: uuid,
                id_user,
                name,
                token,
                ip,
                login_at: getFormattedDate(),
                logout_at: null,
            };

            console.log(data);
            const result = await postSession(data);
            console.log(result);
            res.status(200).json({
                status: 200,
                message: "Login session success",
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

    putData: async (req, res, next) => {
        try {
            const { id } = req.params;
            const logout = getFormattedDate();

            const result = await putSession(logout, id);
            console.log(result);
            res.status(200).json({
                status: 200,
                message: "Logout session success",
                data: result,
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

module.exports = LoginSession;
