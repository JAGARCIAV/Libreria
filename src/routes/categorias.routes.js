  import { Router } from "express";
  import { isLoggedIn } from "../middlewares/protectedRoutes.js";
  import {
    renderAddCategory,
    addCategory,
    renderCategories,
    deleteCategory,
    editCategory,
    renderEditCategory,
    
  } from "../controllers/categorias.controller.js";

  const router = Router();

  // Rutas para las categorías
  router.get("/", isLoggedIn, renderCategories); // Renderiza la lista de categorías
  router.get("/add", isLoggedIn, renderAddCategory); // Renderiza el formulario para agregar una categoría
  router.post("/add", isLoggedIn, addCategory); // Agrega una nueva categoría
  router.get("/delete/:id", isLoggedIn, deleteCategory); // Elimina una categoría
  router.get("/edit/:id", isLoggedIn, renderEditCategory); // Renderiza el formulario para editar una categoría
  router.post("/edit/:id", isLoggedIn, editCategory); // Actualiza una categoría


  export default router;
