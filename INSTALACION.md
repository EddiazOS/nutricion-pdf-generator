# Guía de Instalación Detallada

## Requisitos Globales

- **Python 3.9+**
- **Rust + Cargo** (para instalar Typst)
- **Git**

## Opción 1: macOS / Linux

### 1. Clonar el repositorio

```bash
git clone https://github.com/EddiazOS/nutricion-pdf-generator.git
cd nutricion-pdf-generator
```

### 2. Ejecutar setup automático

```bash
chmod +x setup.sh
./setup.sh
```

Esto automáticamente:
- ✅ Verifica Python 3.9+
- ✅ Crea entorno virtual
- ✅ Instala dependencias Python
- ✅ Verifica/instala Typst

### 3. Usar el generador

```bash
# Activar entorno virtual
source venv/bin/activate

# Editar productos
vim data/productos.json

# Generar PDFs
python src/generator.py
```

## Opción 2: Windows

### 1. Clonar el repositorio

```powershell
git clone https://github.com/EddiazOS/nutricion-pdf-generator.git
cd nutricion-pdf-generator
```

### 2. Instalación Manual

#### Paso 2a: Python

```powershell
# Verificar Python
python --version

# Si no tienes Python, descarga desde https://python.org

# Crear entorno virtual
python -m venv venv

# Activar entorno
.\venv\Scripts\activate

# Instalar dependencias
pip install -r requirements.txt
```

#### Paso 2b: Rust + Typst

```powershell
# Instalar Rust desde https://rustup.rs/
# (Descarga el instalador .exe)

# Luego instala Typst
cargo install typst-cli

# Verifica la instalación
typst --version
```

### 3. Usar el generador

```powershell
# Activar entorno virtual
.\venv\Scripts\activate

# Editar productos con tu editor favorito
code data/productos.json  # Si tienes VSCode

# Generar PDFs
python src/generator.py
```

## Solución de Problemas

### Error: "typst: command not found"

**Solución:**
```bash
# Verificar instalación
cargo --version  # Debe mostrar versión

# Reinstalar
cargo install typst-cli --force

# En Windows, reinicia PowerShell después de instalar
```

### Error: "ModuleNotFoundError: No module named 'click'"

**Solución:**
```bash
# Activar entorno virtual
source venv/bin/activate  # macOS/Linux
# o
.\venv\Scripts\activate   # Windows

# Reinstalar dependencias
pip install -r requirements.txt
```

### Error: "No such file or directory: data/productos.json"

**Solución:**
```bash
# Asegúrate de estar en la raíz del proyecto
ls   # macOS/Linux
dir  # Windows

# Debería mostrar: data, src, templates, README.md, etc.
```

### Los PDFs se generan pero están vacíos o con errores

**Solución:**
1. Verifica que `data/productos.json` sea JSON válido
   ```bash
   python -m json.tool data/productos.json
   ```

2. Revisa los valores en el archivo JSON
   - Todos los valores deben ser números o strings
   - Las matrices deben estar bien formadas

3. Ejecuta el generador con debug:
   ```bash
   python src/generator.py -v
   ```

## Estructura de Directorios

```
nutricion-pdf-generator/
├── data/
│   └── productos.json        # 📋 Tus productos aquí
├── templates/
│   └── etiqueta_nutricional.typ  # 🎨 Template Typst
├── src/
│   ├── generator.py          # 🚀 Script principal
│   └── data_processor.py     # ⚙️ Procesador de datos
├── output/                    # 📄 PDFs generados
├── README.md
├── requirements.txt
├── setup.sh
└── INSTALACION.md
```

## Flujo de Trabajo

```
1. Editar data/productos.json
        ↓
2. Ejecutar python src/generator.py
        ↓
3. Script carga JSON
        ↓
4. DataProcessor genera Typst dinámico
        ↓
5. Typst compila a PDF
        ↓
6. PDF listo en output/
```

## Personalización Avanzada

### Modificar diseño

Edita `templates/etiqueta_nutricional.typ` para cambiar:
- **Colores**: Modifica `#let thick-line = stroke(...)`
- **Tamaños de fuente**: Cambia `size: 11pt`
- **Espaciados**: Ajusta `inset: 10pt`, `margin:`
- **Rotación**: Cambia `rotate(90deg)` a otro ángulo

### Añadir nuevos campos

1. Actualiza `data/productos.json` con nuevos campos
2. Modifica `src/data_processor.py` para extraer los datos
3. Actualiza `templates/etiqueta_nutricional.typ` para mostrar

## Rendimiento

- ⚡ Cada PDF toma ~2-3 segundos en generarse
- 📦 Tamaño de PDF: ~50-100 KB cada uno
- 🔄 Puedes generar ilimitados productos

## Soporte

Si encuentras problemas:
1. Revisa el archivo `setup.sh` o `INSTALACION.md`
2. Verifica que tengas las versiones correctas:
   ```bash
   python --version   # 3.9+
   typst --version    # Últimas versión
   rustc --version    # Cualquier versión reciente
   ```
3. Abre un issue en GitHub con:
   - Tu sistema operativo
   - Versiones de herramientas
   - Error exacto

¡Gracias por usar el Generador de Etiquetas Nutricionales! 🎉
