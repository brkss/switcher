"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.save = void 0;
const db_json_1 = __importDefault(require("./db.json"));
const save = async () => {
    const data = db_json_1.default;
    data.map((database) => { });
    console.log("db => ", db_json_1.default);
};
exports.save = save;
//# sourceMappingURL=save.js.map