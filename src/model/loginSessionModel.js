const pool = require("../config/db");

const getSession = async (id) => {
    console.log("model getSession");
    try {
        const queryString = "SELECT * FROM login_session WHERE id_user = ?";
        const values = [id];

        const [result] = await pool.execute(queryString, values);
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const postSession = async (data) => {
    const { id, id_user, name, token, ip, login_at, logout_at } = data;
    console.log("model postSession");
    try {
        const queryString =
            "INSERT INTO login_session (id, id_user, name, token, ip, login_at, logout_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        const values = [id, id_user, name, token, ip, login_at, logout_at];

        const [result] = await pool.execute(queryString, values);
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const putSession = async (logout, id) => {
    console.log("model putSession");
    try {
        const queryString =
            "UPDATE login_session SET logout_at = ? WHERE id= ?";
        const values = [logout, id]; // Urutan sesuai dengan kolom yang akan di-update dan kondisi WHERE

        const [result] = await pool.execute(queryString, values);
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

module.exports = { getSession, postSession, putSession };
