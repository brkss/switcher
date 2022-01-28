import exec from "child_process";
import fs from "fs";
import db from "./db.json";

interface IDatabase {
  name: string;
  file: string;
  in_use: boolean;
}

export const save = async () => {
  const data: IDatabase[] = db;
  data.map((database) => {});
  console.log("db => ", db);
};
