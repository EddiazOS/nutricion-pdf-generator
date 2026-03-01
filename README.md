# Generador de Etiquetas Nutricionales en PDF

Herramienta para generar etiquetas nutricionales profesionales en formato PDF con diseño personalizado: líneas gruesas separadoras, información adicional rotada 90°, y soporte para múltiples productos.

## Características

- 🎨 **Diseño profesional**: Líneas gruesas para separar secciones
- 🔄 **Información rotada**: Datos adicionales y referencias en 90° a la derecha
- 📊 **Tablas dinámicas**: Genera automáticamente a partir de datos JSON
- 🔢 **Múltiples productos**: Soporte para gestionar varios productos
- 📦 **Salida PDF**: Genera PDFs de alta calidad listos para imprimir

## Estructura del Proyecto

```
nutricion-pdf-generator/
├── README.md
├── requirements.txt
├── data/
│   └── productos.json          # Base de datos de productos
├── templates/
│   └── etiqueta_nutricional.typ # Template de Typst
├── src/
│   ├── generator.py             # Script principal
│   └── data_processor.py        # Procesamiento de datos
└── output/
    └── (PDFs generados)
```

## Instalación

### Requisitos
- Python 3.9+
- Typst (instalable via `cargo install typst-cli`)

### Setup

```bash
# Clonar repositorio
git clone https://github.com/EddiazOS/nutricion-pdf-generator.git
cd nutricion-pdf-generator

# Instalar dependencias Python
pip install -r requirements.txt

# Instalar Typst (macOS/Linux/Windows)
cargo install typst-cli
```

## Uso

### 1. Definir productos en `data/productos.json`

```json
{
  "productos": [
    {
      "nombre": "Granola Crujiente",
      "tamanio_porcion": "1 cucharadita (3g)",
      "porciones_envase": 20,
      "nutrientes": {
        "energia_kcal": 342,
        "proteina_g": 8.5,
        "grasa_total_g": 1.3,
        ...
      }
    }
  ]
}
```

### 2. Ejecutar generador

```bash
python src/generator.py
```

Los PDFs se guardarán en `output/`

## Información Adicional (Texto Rotado)

La sección derecha incluye:
- **Ingredientes**: Lista completa de ingredientes
- **Alérgenos**: Advertencias de alérgenos comunes
- **Modo de uso**: Recomendaciones de consumo
- **Referencias**: Información de fabricante, lote, etc.

Todo rotado 90° para optimizar el espacio.

## Personalización

Modifica `templates/etiqueta_nutricional.typ` para:
- Cambiar colores
- Ajustar tamaños de fuente
- Modificar espaciados y líneas
- Alterar disposición de elementos

## Ejemplos de Salida

Ver carpeta `output/` para PDFs generados.

## Licencia

MIT

## Autor

Generado automáticamente | 2026
