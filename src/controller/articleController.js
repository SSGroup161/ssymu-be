const {
    getArticle,
    getArticleByIdTitle,
    getArticleById,
    getArticlesByStatus,
    postArticle,
    deleteById,
    putArticle,
    softDelete,
    postingArticle,
} = require("../model/articleModel");
require("dotenv").config();
const xss = require("xss");
const { v4: uuidv4 } = require("uuid");
const cloudinary = require("../config/cloudinary");
const dateNow = new Date();

const articleController = {
    getDataById: async (req, res, next) => {
        try {
            const { id } = req.params;

            const dataArticleById = await getArticleByIdTitle(id);

            if (!dataArticleById) {
                return res.status(404).json({
                    status: 404,
                    message: "Artikel tidak ditemukan",
                    data: null,
                });
            }

            res.status(200).json({
                status: 200,
                message: "Get data article by ID success",
                data: dataArticleById,
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    getData: async (req, res, next) => {
        try {
            const dataArticle = await getArticle();
            res.status(200).json({
                status: 200,
                message: "get data article success",
                data: dataArticle,
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: "Internal server error",
            });
        }
    },

    getDataByStatus: async (req, res, next) => {
        try {
            const { id } = req.params;

            const newId = xss(id);

            const dataArticleByStatus = await getArticlesByStatus(newId);
            res.status(200).json({
                status: 200,
                message: "get data articlebystatus success",
                data: dataArticleByStatus,
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
                title,
                creator,
                caption_img,
                description,
                place,
                related_product,
            } = req.body;
            const link_img = req.file;
            const uuid = uuidv4();

            console.log("post data");
            console.log(
                title,
                creator,
                link_img,
                caption_img,
                description,
                place,
                related_product
            );

            if (!req.isFileValid) {
                return res
                    .status(404)
                    .json({ message: req.isFileValidMessage });
            }

            if (
                !title ||
                !creator ||
                !link_img ||
                !caption_img ||
                !description ||
                !place ||
                !related_product
            ) {
                return res.status(400).json({
                    status: 400,
                    message: "input required",
                });
            }

            const resultt = await cloudinary.uploader.upload(link_img.path, {
                use_filename: true,
                folder: "SSYMU/Article",
            });

            const id_title = title.toLowerCase().replace(/\s+/g, "-");

            console.log("data");
            const data = {
                id: uuid,
                id_title: xss(id_title),
                title: xss(title),
                creator: xss(creator),
                day: null,
                date: null,
                link_img: resultt.secure_url,
                public_id: resultt.public_id,
                caption_img: xss(caption_img),
                description: xss(description),
                place: xss(place),
                status: "pending",
                related_product: xss(related_product),
                updated_at: null,
                deleted_at: null,
            };

            console.log(data);
            const result = await postArticle(data);
            console.log(result);

            res.status(200).json({
                status: 200,
                message: "Article has been added!",
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

    deleteSoftDataById: async (req, res, next) => {
        const { id } = req.params;

        try {
            const dataArticle = await getArticleByIdTitle(id);
            if (!dataArticle) {
                return res
                    .status(404)
                    .json({ status: 404, message: "Article not found" });
            }

            const result = await softDelete(new Date(), id);
            if (!result || result.affectedRows === 0 || result.rowCount === 0) {
                throw new Error("Failed to soft delete article");
            }

            res.status(200).json({
                status: 200,
                message: "Article soft deleted successfully",
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: err.message || "Internal server error",
            });
        }
    },

    deleteDataById: async (req, res, next) => {
        const { id } = req.params;

        try {
            const dataArticle = await getArticleByIdTitle(id);
            if (!dataArticle) {
                return res
                    .status(404)
                    .json({ status: 404, message: "Article not found" });
            }

            await cloudinary.uploader.destroy(dataArticle.public_id);

            const result = await deleteById(id);
            if (!result || result.affectedRows === 0 || result.rowCount === 0) {
                throw new Error("Failed to delete article");
            }

            res.status(200).json({
                status: 200,
                message: "Article deleted successfully",
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: err.message || "Internal server error",
            });
        }
    },

    postingArticleById: async (req, res, next) => {
        const { id } = req.params;
        const { day, date } = req.body;

        try {
            const dataArticle = await getArticleByIdTitle(id);
            if (!dataArticle) {
                return res
                    .status(404)
                    .json({ status: 404, message: "Article not found" });
            }

            if (dataArticle.posting_at) {
                return res
                    .status(403)
                    .json({ status: 403, message: "Article has been posting" });
            }

            const data = {
                day: xss(day),
                date: xss(date),
                posting_at: new Date(),
            };

            const result = await postingArticle(data, id);
            if (!result || result.affectedRows === 0 || result.rowCount === 0) {
                throw new Error("Failed to posting article");
            }

            res.status(200).json({
                status: 200,
                message: "Article posting successfully",
            });
        } catch (err) {
            console.error(err);
            res.status(500).json({
                status: 500,
                message: err.message || "Internal server error",
            });
        }
    },

    putData: async (req, res, next) => {
        try {
            const { id } = req.params;
            const {
                title,
                creator,
                day,
                date,
                caption_img,
                description,
                place,
                related_product,
            } = req.body;
            const id_title = title.toLowerCase().replace(/\s+/g, "-");

            const dataArticle = await getArticleById(id);

            console.log("put data");
            console.log(dataArticle);

            if (id !== dataArticle.id) {
                return res
                    .status(400)
                    .json({ status: 400, message: "ID Not Found" });
            }

            if (dataArticle.status !== "pending") {
                return res.status(400).json({
                    status: 400,
                    message: "Cannot change this article",
                });
            }

            const data = {
                id_title: id_title ? xss(id_title) : dataArticle.id_title,
                title: title ? xss(title) : dataArticle.title,
                creator: creator ? xss(creator) : dataArticle.creator,
                day: day || dataArticle.day,
                date: date || dataArticle.date,
                caption_img: caption_img
                    ? xss(caption_img)
                    : dataArticle.caption_img,
                description: description
                    ? xss(description)
                    : dataArticle.description,
                place: place ? xss(place) : dataArticle.place,
                link_img: dataArticle.link_img,
                public_id: dataArticle.public_id,
                related_product:
                    xss(related_product) || dataArticle.related_product,
                updated_at: dateNow,
                deleted_at: null,
            };

            if (req.file) {
                const result = await cloudinary.uploader.upload(req.file.path, {
                    use_filename: true,
                    folder: "SSYMU/Article",
                });

                if (dataArticle.public_id) {
                    await cloudinary.uploader.destroy(dataArticle.public_id);
                }

                data.link_img = result.secure_url;
                data.public_id = result.public_id;
            } else if (dataArticle.link_img && !req.file) {
                data.link_img = dataArticle.link_img;
                data.public_id = dataArticle.public_id;
            }

            const result = await putArticle(data, dataArticle.id);
            console.log(result);

            res.status(200).json({
                status: 200,
                message: "Update data article success",
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
};

module.exports = articleController;
