const http = require("http");

const PORT = process.env.PORT || 3000;
const APP_ENV = process.env.APP_ENV || "development";
const DATABASE_URL = process.env.DATABASE_URL || "";

const server = http.createServer((req, res) => {
	if (req.method === "GET" && req.url === "/health") {
		res.writeHead(200, { "Content-Type": "application/json" });
		res.end(JSON.stringify({ status: "ok" }));
		return;
	}

	if (req.method === "GET" && req.url === "/") {
		res.writeHead(200, { "Content-Type": "application/json" });
		res.end(
			JSON.stringify({
				message: `API running in ${APP_ENV} environment`,
			})
		);
		return;
	}

	res.writeHead(404, { "Content-Type": "application/json" });
	res.end(JSON.stringify({ error: "Not Found" }));
});

server.listen(PORT, () => {
	const dbConfigured = DATABASE_URL ? "yes" : "no";
	console.log(`Server listening on port ${PORT}`);
	console.log(`APP_ENV=${APP_ENV}`);
	console.log(`DATABASE_URL configured=${dbConfigured}`);
});
