import { z } from "zod";

export const createProductoSchema = z.object({
  nombre: z
    .string({
      message: "Nombre must be a string",
    })
    .min(3, {
      message: "Nombre must be at least 3 characters",
    })
    .max(100, {
      message: "Nombre must be at most 100 characters",
    }),
  
  descripcion: z
    .string({
      message: "Descripción must be a string",
    })
    .max(1000, {
      message: "Descripción must be at most 1000 characters",
    })
    .optional(),
  
  precio: z
    .number({
      message: "Precio must be a number",
    })
    .positive({
      message: "Precio must be a positive number",
    })
    .max(999999.99, {
      message: "Precio must be less than 1,000,000",
    }),

  url_imagen: z
    .string({
      message: "URL de imagen must be a string",
    })
    .url({
      message: "URL de imagen must be a valid URL",
    })
    .optional(),
});
