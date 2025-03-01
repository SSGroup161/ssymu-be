const pool = require("../config/db");

const getLogin = async (data) => {
    const { email } = data;
    console.log("model getLogin");
    try {
        const queryString = "SELECT * FROM users WHERE email = ?";
        const values = [email];

        const [result] = await pool.execute(queryString, values);
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const getUsersBySub = async (sub) => {
    console.log("model getUsersBySub");
    try {
        const query = "SELECT * FROM users WHERE sub = ?";
        const [rows] = await pool.execute(query, [sub]);

        if (rows.length === 0) {
            return null;
        }

        return rows[0];
    } catch (err) {
        console.error("Error in getUsersBySub:", err);
        throw err;
    }
};

const getUsersById = async (id) => {
    console.log("model getUsersById");
    try {
        const query = "SELECT * FROM users WHERE id = ?";
        const [rows] = await pool.execute(query, [id]);

        if (rows.length === 0) {
            return null;
        }

        return rows[0];
    } catch (err) {
        console.error("Error in getUsersById:", err);
        throw err;
    }
};

const getUsersByEmail = async (email) => {
    console.log("model getUsersByEmail");
    try {
        const query = "SELECT * FROM users WHERE email = ?";
        const [rows] = await pool.execute(query, [email]);

        if (rows.length === 0) {
            return null;
        }

        return rows[0];
    } catch (err) {
        console.error("Error in getUsersByEmail:", err);
        throw err;
    }
};

const postUsers = async (data) => {
    const {
        id,
        sub,
        name,
        email,
        password,
        notelp,
        address,
        picture,
        public_id,
        email_verified,
    } = data;
    console.log("model postUsers");
    try {
        const queryString = `INSERT INTO users ( id, sub, name, email, password, notelp, address, picture, public_id, email_verified) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
        const values = [
            id,
            sub,
            name,
            email,
            password,
            notelp,
            address,
            picture,
            public_id,
            email_verified,
        ];

        const [result] = await pool.execute(queryString, values);
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const putUsers = async (data, id) => {
    const { sub, name, email, password, notelp, address, picture, public_id } =
        data;
    console.log("model putUsers");
    console.log("Data received in model:", data);
    try {
        const queryString = `
            UPDATE users
            SET sub = ?, name = ?, email = ?, password = ?, notelp = ?, address = ?, picture = ?, public_id = ?
            WHERE id = ?`;
        const values = [
            sub || null,
            name || null,
            email || null,
            password || null,
            notelp || null,
            address || null,
            picture || null,
            public_id || null,
            id,
        ];

        const [result] = await pool.execute(queryString, values);

        if (result.affectedRows === 0) {
            throw new Error(`Users dengan ID ${id} tidak ditemukan.`);
        }
        console.log("Database update successful:", result);
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const putPictureProfile = async (data, id) => {
    const { picture, public_id } = data;
    console.log("model putPictureProfile");
    console.log("Data received in model:", data);
    try {
        const queryString = `
            UPDATE users
            SET picture = ?, public_id = ?
            WHERE id = ?`;
        const values = [picture || null, public_id || null, id];

        const [result] = await pool.execute(queryString, values);

        if (result.affectedRows === 0) {
            throw new Error(`Users dengan ID ${id} tidak ditemukan.`);
        }
        console.log("Database update successful:", result);
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const checkEmailSub = async (email) => {
    try {
        const queryString = "SELECT * FROM users WHERE email = ?";
        const values = [email];
        const [results] = await pool.query(queryString, values);
        if (results.length > 0) {
            return {
                exists: true,
                sub: results[0].sub,
            };
        } else {
            return {
                exists: false,
            };
        }
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const verifyAccount = async (email_verified, id) => {
    console.log("model verifyAccount");
    try {
        const queryString = `
            UPDATE users
            SET email_verified = ? WHERE id = ?`;
        const values = [email_verified || null, id];

        const [result] = await pool.execute(queryString, values);

        if (result.affectedRows === 0) {
            throw new Error(`Users dengan ID ${id} tidak ditemukan.`);
        }
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

const forgotPassword = async (data) => {
    const { new_password, id } = data;
    console.log("model forgotPassword");
    try {
        const queryString = `
            UPDATE users
            SET password = ? WHERE id = ?`;
        const values = [new_password || null, id];

        const [result] = await pool.execute(queryString, values);

        if (result.affectedRows === 0) {
            throw new Error(`Users dengan ID ${id} tidak ditemukan.`);
        }
        return result;
    } catch (err) {
        console.error(err);
        throw err;
    }
};

module.exports = {
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
};
