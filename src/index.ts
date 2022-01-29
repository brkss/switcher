import "dotenv/config";
import express from "express";
import path from "path";
import { save, list, change } from "./utils/utils";
import bodyParser from "body-parser";

(async () => {
  const app = express();

  app.use(bodyParser.urlencoded());
  app.use(bodyParser.json());

  app.get("/", (_, res) => {
    res.sendFile(path.join(__dirname, "/pages/index.html"));
  });

  app.get("/list", (_, res) => {
    res.json(list());
  });

  app.post("/change", async (req, res) => {
    console.log("data => ", req.body.file);
    await change(req.body.file);
    res.send({
      status: true,
    });
  });

  app.post("/save", async (_, res) => {
    await save();
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
