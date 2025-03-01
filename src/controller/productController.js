const {
    getAllProduct,
    getProductById,
    getProductByCategory,
} = require("../model/productModel");

const ProductController = {
    getData: async (req, res, next) => {
        try {
            const dataProduct = await getAllProduct();
            res.status(200).json({
                status: 200,
                message: "Get data product by id success",
                dataProduct,
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    getDataById: async (req, res, next) => {
        try {
            const { id } = req.params;
            const dataProduct = await getProductById(id);

            if (dataProduct) {
                const formattedProduct = {
                    id: dataProduct.id,
                    id_title: dataProduct.id_title,
                    name_product: dataProduct.name_product,
                    description: dataProduct.description,
                    ingredients: dataProduct.ingredients,
                    htu: dataProduct.htu,
                    usp: dataProduct.usp,
                    price: dataProduct.price,
                    category: dataProduct.category,
                    poster: dataProduct.poster,
                    created_at: dataProduct.created_at,
                    updated_at: dataProduct.updated_at,
                    deleted_at: dataProduct.deleted_at,
                    varian1: {
                        name: dataProduct.product_varian1,
                        link: dataProduct.link_ecommerce_varian1,
                        color: dataProduct.color_varian1,
                        asset: dataProduct.asset_varian1,
                        poster: dataProduct.asset_png_varian1,
                    },
                    varian2: {
                        name: dataProduct.product_varian2,
                        link: dataProduct.link_ecommerce_varian2,
                        color: dataProduct.color_varian2,
                        asset: dataProduct.asset_varian2,
                        poster: dataProduct.asset_png_varian2,
                    },
                    varian3: {
                        name: dataProduct.product_varian3,
                        link: dataProduct.link_ecommerce_varian3,
                        color: dataProduct.color_varian3,
                        asset: dataProduct.asset_varian3,
                        poster: dataProduct.asset_png_varian3,
                    },
                    varian4: {
                        name: dataProduct.product_varian4,
                        link: dataProduct.link_ecommerce_varian4,
                        color: dataProduct.color_varian4,
                        asset: dataProduct.asset_varian4,
                        poster: dataProduct.asset_png_varian4,
                    },
                    varian5: {
                        name: dataProduct.product_varian5,
                        link: dataProduct.link_ecommerce_varian5,
                        color: dataProduct.color_varian5,
                        asset: dataProduct.asset_varian5,
                        poster: dataProduct.asset_png_varian5,
                    },
                };

                res.status(200).json({
                    status: 200,
                    message: "Get data product by ID success",
                    dataProduct: formattedProduct,
                });
            } else {
                return res.status(404).json({
                    status: 404,
                    message: "Product not found",
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

    getDataByCategory: async (req, res, next) => {
        try {
            const { id } = req.params;
            const dataProduct = await getProductByCategory(id);

            if (dataProduct) {
                res.status(200).json({
                    status: 200,
                    message: "Get data product by category success",
                    dataProduct,
                });
            } else {
                return res.status(404).json({
                    status: 404,
                    message: "Product not found",
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
};

module.exports = ProductController;
