import { createPool } from "mysql2/promise";  // Usamos mysql2 con soporte para promesas
import { database } from "./config.js";  // Importa la configuración de la base de datos

// Crea el pool de conexiones a la base de datos usando la configuración
export const pool = createPool(database);


/*No Tocar Esta PArte Por nada */