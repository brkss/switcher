"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require("dotenv/config");
const express_1 = __importDefault(require("express"));
const path_1 = __importDefault(require("path"));
const save_1 = require("./utils/save");
(async () => {
    console.log("Momentum !");
    const app = express_1.default();
    app.get("/", (_, res) => {
        res.sendFile(path_1.default.join(__dirname, "/pages/index.html"));
    });
    app.post("/save", async (_, res) => {
        await save_1.save();
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