import { Router } from "express";
import auth from "./auth.routes.js";
import index from "./index.routes.js";
import productos from "./productos.routes.js";
import user from "./user.routes.js";
import categorias from "./categorias.routes.js"; // Cambia el nombre si corresponde


const router = Router();

router.use(index);
router.use(auth);
router.use(user);
router.use("/productos", productos);
router.use("/categorias", categorias); // Agrega la ruta de categorías


export default router;
