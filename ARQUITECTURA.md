# Arquitectura del Generador de Etiquetas Nutricionales

## Visión General

Este proyecto utiliza una arquitectura de **2 capas**:

```
┌────────────────────────┐
│  DATA LAYER (JSON)                   │
│  data/productos.json                │
└────────────────────────┘
         ↑
         │
┌────────────────────────┐
│  PROCESSING LAYER (Python)          │
│  generator.py + data_processor.py   │
└────────────────────────┘
         ↑
         │
┌────────────────────────┐
│  RENDERING LAYER (Typst)            │
│  templates/etiqueta_nutricional.typ │
└────────────────────────┘
         ↑
         │
┌────────────────────────┐
│  OUTPUT LAYER (PDF)                 │
│  output/*.pdf                       │
└────────────────────────┘
```

## Flujo de Datos

### 1. Capa de Datos (DATA LAYER)

**Archivo:** `data/productos.json`

```json
{
  "productos": [
    {
      "id": "granola_crujiente",
      "nombre": "Granola Crujiente",
      "tamanio_porcion": "1 cucharadita (3 g)",
      "nutrientes": {
        "energia_kcal_100g": 342,
        "energia_kcal_porcion": 10,
        // ... más nutrientes
      },
      "ingredientes": [ ... ],
      "referencias": { ... }
    }
  ]
}
```

**Responsabilidades:**
- 📋 Almacenar datos de productos
- 🔠 Ser fácilmente editable
- 🔄 Permitir añadir más productos sin código

---

### 2. Capa de Procesamiento (PROCESSING LAYER)

**Archivos:** `src/generator.py` y `src/data_processor.py`

#### `generator.py` - Orquestación

```python
class NutricionPDFGenerator:
    def generate_all()        # Punto de entrada
    def load_productos()      # Lee JSON
    def generate_typst_content()  # Procesa datos
    def compile_pdf()         # Crea PDF
```

**Responsabilidades:**
- 🚀 Orquestar flujo general
- 📂 Cargar datos JSON
- 📦 Iterar sobre productos
- 📚 Compilar PDFs

#### `data_processor.py` - Transformación

```python
class DataProcessor:
    def format_number()       # Formatea números
    def get_ingredientes_text()   # Procesa ingredientes
    def generate_typst_template() # Genera Typst dinámico
```

**Responsabilidades:**
- 📤 Transformar datos JSON a formato de presentación
- 📊 Formatear números correctamente
- 🎨 Generar templates Typst personalizados
- 💯 Inyectar datos en plantilla

**Ejemplo de transformación:**

```
JSON Input:
{
  "energia_kcal_100g": 342,
  "energia_kcal_porcion": 10
}
        ↓
DataProcessor.format_number() & generate_typst_template()
        ↓
Typst Output:
#tablex(
  cellx(stroke: none, [*342*]),
  cellx(stroke: none, [*10*]),
)
```

---

### 3. Capa de Renderizado (RENDERING LAYER)

**Archivo:** `templates/etiqueta_nutricional.typ`

**Tecnología:** Typst (sistema de composición de documentos profesional)

**Estructura del Template:**

```typst
// Definir variables de diseño
#let thick-line = stroke(2pt + black)

// Crear layout de dos columnas
#grid(
  columns: (1fr, 2.5cm),  // Columna principal + lateral
  [
    // Sección izquierda: Tabla nutricional
    #box(stroke: thick-line, [
      #tablex(
        // Filas y columnas dinámicamente insertadas
        // por data_processor.py
      )
    ])
  ],
  [
    // Sección derecha: Información rotada 90°
    #rotated-text([
      // Ingredientes, alérgenos, referencias
    ])
  ]
)
```

**Elementos clave:**
- 🔈 `#let thick-line`: Define líneas gruesas
- 🖄 `#grid()`: Layout de dos columnas
- 🔄 `#rotate(90deg)`: Rotación de texto
- 📄 `#tablex()`: Tablas dinámicas
- 📄 `#box()`: Cajas con bordes

**Por qué Typst vs otros?**

| Aspecto | Typst | LaTeX | HTML/CSS |
|--------|-------|-------|----------|
| Diseño | ✅ Moderno | 😈 Anticuado | ✅ Flexible |
| Rotación texto | ✅ Nativo | ❌ Complejo | ✅ Fácil |
| Curva aprendizaje | ✅ Baja | ❌ Alta | ✅ Baja |
| Líneas gruesas | ✅ Simple | ❌ Complicado | ✅ Simple |
| Salida PDF | ✅ Perfecta | ✅ Perfecta | 😈 Requiere conversación |

---

### 4. Capa de Salida (OUTPUT LAYER)

**Directorio:** `output/`

**Archivos generados:**
- `producto_id.pdf` - El PDF final listo para imprimir
- `producto_id.typ` - Template intermedio (se puede eliminar)

---

## Flujo de Ejecución

```
python src/generator.py
    ↓
① NutricionPDFGenerator().__init__()
   - Inicializa rutas de directorios
   - Crea carpeta output/
    ↓
② generator.generate_all()
   - Imprime encabezado
    ↓
③ generator.load_productos()
   - Lee data/productos.json
   - Parsea JSON
   - Retorna lista de productos
    ↓
④ Para cada producto:
   ⩢ DataProcessor(producto)
      - Inicializa procesador
      - Guarda datos del producto
      ⭡ DataProcessor.generate_typst_template()
         - Extrae valores nutricionales
         - Formatea números
         - Procesa ingredientes/alérgenos
         - Genera contenido Typst dinámico
         - Retorna string Typst completo
      ⭡ Retorna template Typst
   ⩢ generator.compile_pdf(typst_content, producto_id)
      - Escribe archivo .typ temporal
      - Ejecuta: typst compile archivo.typ archivo.pdf
      - Verifica éxito
      - Elimina archivo .typ temporal (opcional)
    ↓
⑤ Resultado:
    - output/granola_crujiente.pdf creado
    - output/otroProducto.pdf creado
    - etc.
    ↓
⑥ Imprime estadísticas y ubicación de archivos
```

---

## Diseño de Clases

### `NutricionPDFGenerator`

```
┌────────────────────────┐
│  NutricionPDFGenerator               │
├────────────────────────┤
│ - project_root: Path                │
│ - data_dir: Path                    │
│ - templates_dir: Path               │
│ - output_dir: Path                  │
├────────────────────────┤
│ + __init__()                        │
│ + load_productos()                  │
│ + generate_typst_content()          │
│ + compile_pdf()                     │
│ + generate_all()                    │
└────────────────────────┘

┌────────────────────────┐
│  DataProcessor                      │
├────────────────────────┤
│ - producto: Dict                    │
│ - nutrientes: Dict                  │
│ - ingredientes: List                │
│ - alergenicos: List                 │
├────────────────────────┤
│ + format_number(value: float) -> str│
│ + get_ingredientes_text() -> str   │
│ + get_alergenicos_text() -> str    │
│ + get_referencias_text() -> str    │
│ + generate_typst_template() -> str │
└────────────────────────┘
```

---

## Extensiones Futuras

### 1. Más Productos

Simplemente añade objetos al array `"productos"` en `data/productos.json`:

```json
{
  "productos": [
    { "id": "producto1", ... },
    { "id": "producto2", ... },
    { "id": "producto3", ... }
  ]
}
```

El script procesador iteradorá automáticamente.

### 2. Nuevos Campos Nutricionales

1. Añade campo en `productos.json`:
   ```json
   "nutrientes": {
     "tu_nutriente_100g": 123,
     "tu_nutriente_porcion": 4.5
   }
   ```

2. Procesa en `data_processor.py`:
   ```python
   tu_nutriente_100g = self.format_number(
       self.nutrientes.get('tu_nutriente_100g', 0)
   )
   ```

3. Muestra en template Typst

### 3. Temas/Estilos Alternativos

Crea nuevos templates:
- `templates/etiqueta_minimalista.typ`
- `templates/etiqueta_colorida.typ`

Y modifica `generator.py` para seleccionar template.

### 4. Exportación a otros Formatos

- Typst también puede generar XML, HTML
- Podrías añadir exportación a SVG, PNG

---

## Consideraciones de Rendimiento

| Factor | Impacto | Solución |
|--------|--------|----------|
| Número de productos | Lineal O(n) | Óptimo para 1-1000 productos |
| Tamaño de JSON | Insignificante | Incluso 10MB se carga rápido |
| Compilación Typst | 2-3 seg/PDF | Paralizable con `asyncio` si se necesita |
| Tamaño de PDF | 50-100 KB | Comprimido automáticamente por Typst |

---

## Seguridad

- 🔐 **Entrada JSON**: Parseada como JSON válido, no hay inyección SQL/code
- 🔐 **Tipst Template**: String templates, sin ejecución de código del usuario
- 🔐 **Subprocess**: Solo ejecuta `typst` con archivos locales, sin variables de usuario

---

## Dependencias

```
Python 3.9+
└── json (stdlib)
└── subprocess (stdlib)
└── pathlib (stdlib)
└── typing (stdlib)

Typst (CLI)
└── tablex@0.0.8 (plugin)
```

Todas las dependencias son mínimas y estables.

---

## Conclusión

La arquitectura es:
- 🏁 **Simple**: 2 clases Python, 1 template Typst
- 🔗 **Modular**: Cada capa es independiente
- 📤 **Extensible**: Fácil añadir más productos y campos
- 🚀 **Eficiente**: Bajo acoplamiento, alta cohesión
