import { config } from 'dotenv';  // Importa dotenv para cargar variables de entorno
config();  // Carga las variables de entorno del archivo .env

// Configuración de la base de datos MySQL
export const database = {
  connectionLimit: 10,
  host: process.env.DATABASE_HOST || "localhost",
  user: process.env.DATABASE_USER || "root",  // Asegúrate de que coincida con tu usuario en phpMyAdmin
  password: process.env.DATABASE_PASSWORD || "",  // Añade la contraseña correcta de MySQL
  database: process.env.DATABASE_NAME || "libreria",  // Base de datos configurada en MySQL
  port: process.env.DATABASE_PORT || 3306,
};

// Configuración del puerto para la aplicación
export const port = process.env.PORT || 4000;

// Clave secreta para la sesión
export const SECRET = process.env.SECRET || 'some secret key';


/*No Tocar Esta PArte Por nada */ 