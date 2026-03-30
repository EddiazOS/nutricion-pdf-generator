# Nutrición PDF Generator 🥗

Este proyecto es una herramienta automatizada para generar etiquetas de información nutricional profesionales en formato PDF. Utiliza **Python** para la lógica de automatización y **Typst** como motor de composición tipográfica de alto rendimiento.

## 🚀 Características

- **Basado en Datos**: Define la información de tus productos en archivos YAML simples.
- **Plantillas Flexibles**: Usa una única plantilla profesional para múltiples productos.
- **Automatización**: Genera docenas de etiquetas con un solo comando.
- **Diseño Profesional**: Salida en PDF de alta calidad lista para impresión.

---

## 🛠️ Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

1.  **Python 3.9+**
2.  **Typst CLI**: El script de configuración intentará instalarlo automáticamente si tienes [Rust/Cargo](https://rustup.rs/) instalado. Si no, puedes descargarlo desde [typst.app](https://github.com/typst/typst/releases).

---

## 📦 Configuración Inicial

Para preparar el entorno de desarrollo y las dependencias:

1.  Clona el repositorio o descarga los archivos.
2.  Ejecuta el script de configuración:
    ```bash
    bash setup.sh
    ```
3.  Activa el entorno virtual:
    ```bash
    source venv/bin/activate
    ```

---

## 📖 Guía de Uso

### 1. Preparar los Datos
Crea un archivo `.yaml` dentro de la carpeta `data/`. Puedes usar `data/aceite_coco_200ml.yaml` como referencia. 

**Estructura del YAML:**
```yaml
empresa:
  nombre: "Tu Empresa S.A.S"
  origen: "Ciudad, País"

contenido_neto: "500 g"
porcion_texto: "1 cucharada (15g)"
porciones_por_envase: 33

columnas:
  columna_100: "Por 100g"      # Encabezado de la primera columna
  columna_porcion: "Por porción" # Encabezado de la segunda columna

textos:
  ingredientes: "Lista de ingredientes separados por comas."
  alergenos: "Declaración de alérgenos (ej: Contiene gluten)."
  uso_sugerido: "Instrucciones de uso."
  conservacion: "Instrucciones de almacenamiento."

nutricion:
  calorias_100: 100            # Valor numérico
  calorias_porcion: 15
  # ... (revisa los archivos en data/ para ver todos los campos)
```

### 2. Generar las Etiquetas

#### Generar TODO:
Este comando buscará todos los archivos `.yaml` en `data/` y creará los PDFs correspondientes en `output/`.
```bash
python3 src/generator.py
```

#### Generar un producto específico:
```bash
python3 src/generator.py --data mi_producto.yaml
```

#### Especificar una plantilla o nombre de salida:
```bash
python3 src/generator.py --template mi_plantilla.typ --data datos.yaml --output etiqueta_final.pdf
```

---

## 📂 Estructura del Proyecto

- `data/`: Archivos de origen de datos (YAML).
- `templates/`: Plantillas de diseño de etiquetas (Typst).
- `output/`: PDFs generados.
- `src/`: Lógica del generador en Python.
- `legacy_templates/`: Copias de seguridad de diseños antiguos (informativo).

---

## 🛠️ Solución de Problemas

- **Error de fuente (Arial)**: Si Typst se queja de que no encuentra "Arial", puedes editar `templates/tabla_nutricional_generica.typ` y cambiar la línea `#set text(font: "Arial", ...)` por una fuente que tengas instalada (ej: "Liberation Sans" o simplemente borrar la parte de `font:` para usar la por defecto).
- **Typst no encontrado**: Asegúrate de que `typst` esté en tu PATH o que el entorno virtual esté activo.
