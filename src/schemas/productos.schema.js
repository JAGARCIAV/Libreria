import { z } from "zod";

// Esquema de validación para crear un producto sin límites de longitud
export const createProductSchema = z.object({
  nombre: z
    .string({
      required_error: "Nombre es requerido", // Mensaje de error si falta el nombre
      invalid_type_error: "Nombre debe ser una cadena", // Mensaje si el tipo no es una cadena
    }),

  descripcion: z
    .string({
      required_error: "Descripción es requerida", // Mensaje de error si falta la descripción
      invalid_type_error: "Descripción debe ser una cadena", // Mensaje si el tipo no es una cadena
    }),

  precio: z
    .union([
      z.number().min(0, {
        message: "Precio debe ser mayor o igual a 0", // Mantiene esta validación para evitar valores negativos
      }),
      z.string().transform((value) => {
        const numValue = parseFloat(value);
        if (isNaN(numValue) || numValue < 0) {
          throw new Error("Precio debe ser un número válido y mayor o igual a 0");
        }
        return numValue;
      }),
    ])
    .refine((value) => typeof value === "number" && value >= 0, {
      message: "Precio debe ser mayor o igual a 0",
    }),

  cantidad: z
    .union([
      z.number().min(0, {
        message: "Cantidad debe ser mayor o igual a 0", // Mantiene esta validación
      }),
      z.string().transform((value) => {
        const numValue = parseInt(value, 10);
        if (isNaN(numValue) || numValue < 0) {
          throw new Error("Cantidad debe ser un número válido y mayor o igual a 0");
        }
        return numValue;
      }),
    ]),

  url_imagen: z
    .string({
      required_error: "URL de imagen es requerida", // Mensaje de error si falta la URL de la imagen
      invalid_type_error: "URL de imagen debe ser una cadena", // Mensaje si el tipo no es una cadena
    })
    .url({
      message: "URL de imagen debe ser una URL válida", // Mensaje si la URL no es válida
    }),

  categoria_id: z
    .union([
      z.number().min(1, {
        message: "ID de categoría debe ser mayor o igual a 1", // Mantiene esta validación
      }),
      z.string().transform((value) => {
        const numValue = parseInt(value, 10);
        if (isNaN(numValue) || numValue < 1) {
          throw new Error("ID de categoría debe ser un número válido y mayor o igual a 1");
        }
        return numValue;
      }),
    ]),
});

// Ejemplo de uso
const validateProduct = async (data) => {
  try {
    const validatedData = createProductSchema.parse(data);
    console.log("Datos válidos:", validatedData);
  } catch (e) {
    if (e instanceof z.ZodError) {
      console.error("Errores de validación:", e.errors);
    }
  }
};

// Llamada de ejemplo
validateProduct({
  nombre: "Producto Ejemplo",
  descripcion: "Descripción del producto ejemplo.",
  precio: "9999", // Ahora acepta como string
  cantidad: "9999", // Ahora acepta como string
  url_imagen: "https://example.com/image.jpg",
  categoria_id: "1", // Ahora acepta como string
});
