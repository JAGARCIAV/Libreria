import { pool } from "../database.js";

// Renderiza la lista de categorías
export const renderCategories = async (req, res) => {
  try {
    const [categorias] = await pool.query("SELECT * FROM categorias");
    res.render("categorias/list", { categorias });
  } catch (error) {
    console.error(error);
    req.setFlash("error", "Error al obtener las categorías");
    res.redirect("/categorias");
  }
};

// Renderiza el formulario para agregar una categoría
export const renderAddCategory = (req, res) => {
  res.render("categorias/add");
};

// Agrega una nueva categoría
export const addCategory = async (req, res) => {
  const { nombre, descripcion, url_imagen } = req.body;
  try {
    await pool.query("INSERT INTO categorias (nombre, descripcion, url_imagen) VALUES (?, ?, ?)", [nombre, descripcion, url_imagen]);
    req.setFlash("success", "Categoría agregada exitosamente");
    res.redirect("/categorias");
  } catch (error) {
    console.error(error);
    req.setFlash("error", "Error al agregar la categoría");
    res.redirect("/categorias/add");
  }
};

// Elimina una categoría
export const deleteCategory = async (req, res) => {
  const { id } = req.params;
  try {
    await pool.query("DELETE FROM categorias WHERE id = ?", [id]);
    req.setFlash("success", "Categoría eliminada exitosamente");
    res.redirect("/categorias");
  } catch (error) {
    console.error(error);
    req.setFlash("error", "Error al eliminar la categoría");
    res.redirect("/categorias");
  }
};

// Renderiza el formulario para editar una categoría
export const renderEditCategory = async (req, res) => {
  const { id } = req.params;
  const [categoria] = await pool.query("SELECT * FROM categorias WHERE id = ?", [id]);
  
  if (categoria.length === 0) {
    req.setFlash("error", "Categoría no encontrada");
    return res.redirect("/categorias");
  }
  
  res.render("categorias/edit", { categoria: categoria[0] });
};

// Actualiza una categoría
export const editCategory = async (req, res) => {
  const { id } = req.params;
  const { nombre, descripcion, url_imagen } = req.body;
  try {
    await pool.query("UPDATE categorias SET nombre = ?, descripcion = ?, url_imagen = ? WHERE id = ?", [nombre, descripcion, url_imagen, id]);
    req.setFlash("success", "Categoría actualizada exitosamente");
    res.redirect("/categorias");
  } catch (error) {
    console.error(error);
    req.setFlash("error", "Error al actualizar la categoría");
    res.redirect(`/categorias/edit/${id}`);
  }
};
