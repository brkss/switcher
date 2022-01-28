"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.save = void 0;
const fs_1 = __importDefault(require("fs"));
const db_json_1 = __importDefault(require("./db.json"));
const path_1 = __importDefault(require("path"));
const save = async () => {
    fs_1.default.readdir(path_1.default.join(__dirname, "databases"), (err, files) => {
        console.log("error listing files => ", err);
        console.log("list dir data => ", files);
    });
    const data = db_json_1.default;
    data.map((database) => { });
    console.log("dbs => ", db_json_1.default);
};
exports.save = save;
//# sourceMappingURL=save.js.map