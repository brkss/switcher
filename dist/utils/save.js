"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.save = void 0;
const child_process_1 = require("child_process");
const fs_1 = __importDefault(require("fs"));
const db_json_1 = __importDefault(require("./db.json"));
const path_1 = __importDefault(require("path"));
const dockerSaveDb = (path) => {
    return `docker exec server_db_1 /usr/bin/mysqldump -u root --password=123 opium > ${path}`;
};
const save = async () => {
    const data = db_json_1.default;
    fs_1.default.readdir(path_1.default.join(__dirname, "databases"), (err, files) => {
        console.log("error listing files => ", err);
        console.log("list dir data => ", files);
        data.map((database) => {
            if (database.in_use) {
                child_process_1.exec(dockerSaveDb(`./databases/${database.name}`), (err) => {
                    if (err)
                        console.log("SOMETHING WENT WRONG => ", err);
                });
            }
        });
    });
    console.log("dbs => ", db_json_1.default);
};
exports.save = save;
//# sourceMappingURL=save.js.map