"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require("dotenv/config");
const express_1 = __importDefault(require("express"));
const path_1 = __importDefault(require("path"));
const utils_1 = require("./utils/utils");
const body_parser_1 = __importDefault(require("body-parser"));
(async () => {
    const app = express_1.default();
    app.use(body_parser_1.default.urlencoded());
    app.use(body_parser_1.default.json());
    app.get("/", (_, res) => {
        res.sendFile(path_1.default.join(__dirname, "/pages/index.html"));
    });
    app.get("/list", (_, res) => {
        res.json(utils_1.list());
    });
    app.post("/change", async (req, res) => {
        console.log("data => ", req.body.file);
        await utils_1.change(req.body.file);
        res.send({
            status: true,
        });
    });
    app.post("/save", async (_, res) => {
        await utils_1.save();
        res.json({
            status: true,
        });
    });
    app.get("/databases", (_, res) => {
        res.json([
            {
                name: "Bowl",
                in_use: false,
            },
            {
                name: "Los Polos",
                in_use: false,
            },
        ]);
    });
    app.listen(8000, () => {
        console.log("🚀 Server runing on http://localhost:8000");
    });
})();
//# sourceMappingURL=index.js.map