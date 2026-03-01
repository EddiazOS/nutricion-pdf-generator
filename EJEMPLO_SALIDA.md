# Ejemplos de Salida

Al ejecutar `python src/generator.py`, se generan 4 PDFs profesionales en la carpeta `output/`.

## PDFs Generados

### 1. chimichurri.pdf

**Datos nutricionales** (por 100g / por porción 5g):
- **Energía**: 447.0 kcal / 22.3 kcal
- **Proteína**: 1.0g / 0.0g
- **Grasa Total**: 50.1g / 2.5g
- **Carbohidratos**: 1.5g / 0.1g
- **Azúcares**: 0.5g / 0.0g
- **Fibra**: 0.8g / 0.0g
- **Sodio**: 370.0mg / 18.5mg

**Ingredientes**: Perejil, Cilantro, Aceite vegetal, Ajo, Vinagre, Sal, Pimienta

**Uso**: Condimento para carnes y vegetales

---

### 2. harina_platano.pdf

**Datos nutricionales** (por 100g / por porción 5g):
- **Energía**: 323.6 kcal / 16.2 kcal
- **Proteína**: 3.3g / 0.2g
- **Grasa Total**: 0.9g / 0.0g
- **Carbohidratos**: 75.5g / 3.8g
- **Azúcares**: 3.8g / 0.2g
- **Fibra**: 5.9g / 0.3g
- **Sodio**: 10.2mg / 0.5mg

**Ingredientes**: Plátano verde deshidratado y molido, Sin aditivos ni conservantes

**Uso**: Mezclar en bebidas, productos horneados o postres

---

### 3. hoja_stevia.pdf

**Datos nutricionales** (por 100g / por porción 5g):
- **Energía**: 290.0 kcal / 14.5 kcal
- **Proteína**: 11.4g / 0.6g
- **Grasa Total**: 2.6g / 0.1g
- **Carbohidratos**: 61.9g / 3.1g
- **Azúcares**: 0.0g / 0.0g ⭐ (Sin azúcares)
- **Fibra**: 15.5g / 0.8g
- **Sodio**: 14.9mg / 0.7mg

**Ingredientes**: Hoja de Stevia deshidratada, 100% natural

**Uso**: Endulzante natural, apta para diabéticos, sin calorías

---

### 4. mezcla_curcuma.pdf

**Datos nutricionales** (por 100g / por porción 5g):
- **Energía**: 309.0 kcal / 15.4 kcal
- **Proteína**: 9.7g / 0.5g
- **Grasa Total**: 3.3g / 0.2g
- **Carbohidratos**: 44.5g / 2.2g
- **Azúcares**: 3.1g / 0.1g
- **Fibra**: 22.5g / 1.1g ⭐ (Alta en fibra)
- **Sodio**: 37.0mg / 1.8mg

**Ingredientes**: Cúrcuma, Pimienta negra, Jengibre, Canela, Clavo de olor

**Uso**: Mezclar en bebidas calientes, arroz, vegetales

---

## Diseño de los PDFs

Cada PDF tiene el siguiente diseño:

```
┌──────────────────────────────┐  ┌──────┐
│                           │  │  ROT│
│   INFO NUTRICIONAL       │  │  ATE│
│                           │  │  D°90│
│ ┌──────────────┐ │  │   │
│ │ Calórias (kcal) │ │  │ - Ing.│
│ │ [...datos...] │ │  │ - Aler.│
│ └──────────────┘ │  │ - Uso│
│                           │  │ - Ref.│
│ ┌──────────────┐ │  └──────┘
│ │ Grasas        │ │
│ │ [...datos...] │ │
│ └──────────────┘ │
│ [...más tablas...] │
└──────────────────────────────┘

⬅ COLUMNA IZQUIERDA: Tablas nutricionales con líneas gruesas
➡ COLUMNA DERECHA: Información adicional rotada 90°
```

## Características del Diseño

- ✅ **Líneas gruesas (2pt)** separando cada sección nutricional
- ✅ **Información rotada 90°** en la sección derecha para optimizar espacio
- ✅ **Tablas dinámicas** que se adaptan a los datos
- ✅ **Tipografía profesional** (Arial 11pt)
- ✅ **Formato A4** listo para imprimir
- ✅ **PDF de alta calidad** (~60-100 KB cada uno)

## Paso a Paso para Generar

1. **Clonar y configurar**:
   ```bash
   git clone https://github.com/EddiazOS/nutricion-pdf-generator.git
   cd nutricion-pdf-generator
   chmod +x setup.sh
   ./setup.sh
   ```

2. **Ejecutar generador**:
   ```bash
   python src/generator.py
   ```

3. **Resultado**:
   ```
   🏭 GENERADOR DE ETIQUETAS NUTRICIONALES
   ✅ Cargados 4 productos
   📦 Procesando: Chimichurri
   📝 Archivo Typst creado: chimichurri.typ
   ✅ PDF generado: chimichurri.pdf
   [...]
   ✅ Generación completada: 4/4 PDFs creados
   📂 Ubicación: /ruta/output
   ```

4. **Descargar PDFs**: Están en `output/` listos para descargar

---

## Notas Importantes

- Los PDFs se generan **automáticamente** con los datos de `data/productos.json`
- Puedes **editar datos** en JSON y regenerar PDFs sin cambiar código
- Cada PDF es **independiente** y listo para imprimir
- El **diseño es consistente** en todos los PDFs
- Los datos se **adaptan dinámicamente** al template

🚀 **¡Está listo para usar!**
