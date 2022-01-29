"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.list = exports.change = exports.save = void 0;
const child_process_1 = require("child_process");
const fs_1 = __importDefault(require("fs"));
const db_json_1 = __importDefault(require("./db.json"));
const path_1 = __importDefault(require("path"));
const dockerSaveDB = (path) => {
    return `docker exec server_db_1 /usr/bin/mysqldump -u root --password=${process.env.ROOT_PASSWORD} opium > ${path}`;
};
const dockerRestoreDB = (path) => {
    return `cat ${path} | docker exec -i server_db_1 /usr/bin/mysql -u root --password=${process.env.ROOT_PASSWORD} DATABASE`;
};
const save = async () => {
    const data = db_json_1.default;
    fs_1.default.readdir(path_1.default.join(__dirname, "databases"), (err, files) => {
        console.log("error listing files => ", err);
        console.log("list dir data => ", files);
        data.map((database) => {
            if (database.in_use) {
                child_process_1.exec(dockerSaveDB(path_1.default.join(__dirname, `databases/${database.file}`)), (err) => {
                    if (err)
                        console.log("SOMETHING WENT WRONG => ", err);
                });
            }
        });
    });
    console.log("dbs => ", db_json_1.default);
};
exports.save = save;
const change = async (file) => {
    const data = db_json_1.default;
    await exports.save();
    for (let d of data) {
        if (d.file == file) {
            child_process_1.exec(dockerRestoreDB(path_1.default.join(__dirname, `databases/${file}`)), (err) => {
                console.log("Error accured while restaurng database => ", err);
            });
        }
    }
};
exports.change = change;
const list = () => {
    return db_json_1.default;
};
exports.list = list;
//# sourceMappingURL=utils.js.map