# 🚀 Inicio Rápido - 3 Pasos

## 1️⃣ Clonar y Configurar (2 minutos)

```bash
# Clonar repositorio
git clone https://github.com/EddiazOS/nutricion-pdf-generator.git
cd nutricion-pdf-generator

# Setup automático (macOS/Linux)
chmod +x setup.sh
./setup.sh

# O si estás en Windows, sigue INSTALACION.md
```

## 2️⃣ Generar PDFs (30 segundos)

```bash
# Activar entorno (si es necesario)
source venv/bin/activate  # macOS/Linux
.\venv\Scripts\activate   # Windows

# Ejecutar generador
python src/generator.py
```

## 3️⃣ Descargar Resultados

✅ Los 4 PDFs están en `output/`:

```
output/
├── chimichurri.pdf              (447 kcal/100g)
├── harina_platano.pdf           (323.6 kcal/100g)
├── hoja_stevia.pdf              (290 kcal/100g)
└── mezcla_curcuma.pdf           (309 kcal/100g)
```

---

## Productos Incluidos

| 🌟 | Producto | Energía | Estado |
|---|----------|---------|--------|
| 1 | **Chimichurri** | 447 kcal | ✅ Listo |
| 2 | **Harina de Plátano** | 323.6 kcal | ✅ Listo |
| 3 | **Hoja de Stevia** | 290 kcal | ✅ Listo |
| 4 | **Mezcla de Cúrcuma** | 309 kcal | ✅ Listo |

---

## ❓ Problemas Comunes

### "typst: command not found"
```bash
# Instala Rust primero desde https://rustup.rs/
cargo install typst-cli
```

### "ModuleNotFoundError: No module named 'click'"
```bash
source venv/bin/activate
pip install -r requirements.txt
```

### "No such file or directory: data/productos.json"
```bash
# Asegúrate de estar en la carpeta del proyecto
ls   # macOS/Linux
dir  # Windows
# Debe mostrar: data/, src/, templates/, README.md, etc.
```

---

## 📄 Documentación Completa

- **README.md** → Visión general
- **INSTALACION.md** → Setup detallado por SO
- **ARQUITECTURA.md** → Detalles técnicos
- **EJEMPLO_SALIDA.md** → Qué PDFs se generan

---

## 🎉 Personalización

Si quieres **cambiar datos**:

1. Edita `data/productos.json`
2. Ejecuta `python src/generator.py` de nuevo
3. ¡Nuevos PDFs listos!

---

## 🔐 Requisitos Mínimos

- Python 3.9+
- Typst (instalable automáticamente)
- Git

**Tiempo total**: ~5 minutos desde cero

---

## 😀 ¡Listo! 

Si todo funcía:
- ✅ Clonaste el repo
- ✅ Ejecutaste setup.sh
- ✅ Corriste `python src/generator.py`
- ✅ Tienes 4 PDFs en `output/`

**ÁFelicidades!** 🌟 Tu generador de etiquetas nutricionales está funcionando.

---

## Siguiente paso

Explora las otras guías para:
- 📈 Entender la arquitectura
- 🎎 Personalizar el diseño
- 📐 Añadir más productos
