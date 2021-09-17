import Helper from "./helper.js";
import Router from "./router.js";
//import System from "./system.js";

var routeIT = new Router();
await routeIT.getRoutes();
await routeIT.routeIn();

