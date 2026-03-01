# Generador de Etiquetas Nutricionales en PDF

Herramienta para generar etiquetas nutricionales profesionales en formato PDF con diseño personalizado: líneas gruesas separadoras, información adicional rotada 90°, y soporte para múltiples productos.

## Características

- 🎨 **Diseño profesional**: Líneas gruesas para separar secciones
- 🔄 **Información rotada**: Datos adicionales y referencias en 90° a la derecha
- 📊 **Tablas dinámicas**: Genera automáticamente a partir de datos JSON
- 🔢 **4 Productos incluidos**: Chimichurri, Harina de Plátano, Hoja de Stevia, Mezcla de Cúrcuma
- 📦 **Salida PDF**: Genera PDFs de alta calidad listos para imprimir

## Estructura del Proyecto

```
nutricion-pdf-generator/
├── README.md
├── requirements.txt
├── data/
│   └── productos.json          # 📋 Base de datos con 4 productos
├── templates/
│   └── etiqueta_nutricional.typ # 🎨 Template profesional
├── src/
│   ├── generator.py             # 🚀 Script principal
│   └── data_processor.py        # ⚙️ Procesador de datos
├── output/
│   └── (4 PDFs generados)
├── INSTALACION.md           # Guía de setup
└── ARQUITECTURA.md          # Documentación técnica
```

## Productos Incluidos

| Producto | Energía | Proteína | Grasas | Carbohidratos |
|----------|---------|-----------|--------|---------------|
| **Chimichurri** | 447 kcal | 1.0g | 50.1g | 1.5g |
| **Harina de Plátano** | 323.6 kcal | 3.3g | 0.9g | 75.5g |
| **Hoja de Stevia** | 290 kcal | 11.4g | 2.6g | 61.9g |
| **Mezcla de Cúrcuma** | 309 kcal | 9.7g | 3.3g | 44.5g |

## Instalación

### Requisitos
- Python 3.9+
- Typst (instalable via `cargo install typst-cli`)

### Setup Rápido

**macOS/Linux:**
```bash
git clone https://github.com/EddiazOS/nutricion-pdf-generator.git
cd nutricion-pdf-generator
chmod +x setup.sh
./setup.sh
```

**Windows:**
Ver `INSTALACION.md` para instrucciones detalladas.

## Uso

### 1. Los datos ya están incluidos

El archivo `data/productos.json` contiene los 4 productos con todos sus datos nutricionales.

### 2. Ejecutar generador

```bash
# Activar entorno virtual (si es necesario)
source venv/bin/activate  # macOS/Linux
.\venv\Scripts\activate   # Windows

# Generar PDFs
python src/generator.py
```

### 3. Revisar PDFs

Los 4 PDFs se generarán en `output/`:
- `chimichurri.pdf`
- `harina_platano.pdf`
- `hoja_stevia.pdf`
- `mezcla_curcuma.pdf`

## Modificar Datos

Para actualizar información nutricional, edita `data/productos.json`:

```json
{
  "productos": [
    {
      "id": "chimichurri",
      "nombre": "Chimichurri",
      "nutrientes": {
        "energia_kcal_100g": 447.0,
        "proteina_100g": 1.0,
        // ... más datos
      },
      "ingredientes": [...],
      "alergenicos": [...]
    }
  ]
}
```

Luego ejecuta `python src/generator.py` para regenerar los PDFs.

## Personalización

Modifica `templates/etiqueta_nutricional.typ` para:
- Cambiar colores
- Ajustar tamaños de fuente
- Modificar espaciados y líneas
- Alterar disposición de elementos

## Documentación

- **INSTALACION.md**: Guía paso a paso para macOS, Linux, Windows
- **ARQUITECTURA.md**: Detalles técnicos, flujo de datos, diseño de clases

## Flujo de Trabajo

```
① Clonar repositorio
   ↓
② Ejecutar setup.sh o instalar manualmente
   ↓
③ python src/generator.py
   ↓
④ ✅ 4 PDFs generados en output/
```

## Licencia

MIT

## Autor

Generado para optimizar procesos de etiquetado nutricional | 2026
