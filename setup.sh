#!/bin/bash

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}👋 Setup del Generador de Etiquetas Nutricionales${NC}"
echo -e "${BLUE}================================================${NC}\n"

# Verificar Python
echo -e "${BLUE}👀 Verificando Python...${NC}"
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ Python3 no encontrado. Por favor instala Python 3.9+${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Python $(python3 --version)${NC}\n"

# Crear entorno virtual
echo -e "${BLUE}📦 Creando entorno virtual...${NC}"
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo -e "${GREEN}✅ Entorno virtual creado${NC}"
else
    echo -e "${GREEN}✅ Entorno virtual ya existe${NC}"
fi

# Activar entorno virtual
source venv/bin/activate
echo -e "${GREEN}✅ Entorno virtual activado${NC}\n"

# Instalar dependencias Python
echo -e "${BLUE}📋 Instalando dependencias Python...${NC}"
pip install -r requirements.txt > /dev/null 2>&1
echo -e "${GREEN}✅ Dependencias instaladas${NC}\n"

# Verificar Typst
echo -e "${BLUE}👀 Verificando Typst...${NC}"
if ! command -v typst &> /dev/null; then
    echo -e "${RED}❌ Typst no encontrado${NC}"
    echo -e "${BLUE}Instalando Typst con Cargo...${NC}"
    
    if ! command -v cargo &> /dev/null; then
        echo -e "${RED}❌ Cargo no encontrado. Instala Rust desde: https://rustup.rs/${NC}"
        exit 1
    fi
    
    cargo install typst-cli
    echo -e "${GREEN}✅ Typst instalado${NC}"
else
    echo -e "${GREEN}✅ Typst $(typst --version)${NC}"
fi

# Crear directorios necesarios
echo -e "\n${BLUE}📋 Creando estructura de directorios...${NC}"
mkdir -p data templates src output
echo -e "${GREEN}✅ Directorios creados${NC}"

# Hacer scripts ejecutables
chmod +x src/generator.py

echo -e "\n${GREEN}================================================${NC}"
echo -e "${GREEN}✅ 🌟 Setup completado exitosamente!${NC}"
echo -e "${GREEN}================================================${NC}\n"

echo -e "${BLUE}Próximos pasos:${NC}"
echo -e "1. Edita ${BLUE}data/productos.json${NC} con tus productos"
echo -e "2. Ejecuta: ${BLUE}python src/generator.py${NC}"
echo -e "3. Los PDFs se generarán en ${BLUE}output/${NC}\n"

echo -e "${BLUE}Para activar el entorno en el futuro:${NC}"
echo -e "${GREEN}source venv/bin/activate${NC}\n"
