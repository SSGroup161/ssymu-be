const pool = require("../config/db");

const getProductById = async (id) => {
    console.log("model getProductById");
    try {
        const query = "SELECT * FROM product WHERE id_title = ?";
        const [rows] = await pool.execute(query, [id]);

        if (rows.length === 0) {
            return null;
        }

        return rows[0];
    } catch (err) {
        console.error("Error in getProductById:", err);
        throw err;
    }
};

const getProductByCategory = async (id) => {
    console.log("model getProductByCategory");
    try {
        const query = "SELECT * FROM product WHERE category = ?";
        const [rows] = await pool.execute(query, [id]);

        if (rows.length === 0) {
            return null;
        }

        return rows;
    } catch (err) {
        console.error("Error in getProductByCategory:", err);
        throw err;
    }
};

const getAllProduct = async () => {
    console.log("model getAllProduct");
    try {
        const query = "SELECT * FROM product ORDER BY name_product DESC";
        const [rows] = await pool.execute(query);

        if (rows.length === 0) {
            return null;
        }

        return rows;
    } catch (err) {
        console.error("Error in getAllProduct:", err);
        throw err;
    }
};

module.exports = { getProductById, getAllProduct, getProductByCategory };
