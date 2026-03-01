#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Generador de Etiquetas Nutricionales en PDF
Combina datos JSON con templates Typst para generar PDFs profesionales
"""

import json
import subprocess
import sys
from pathlib import Path
from data_processor import DataProcessor

class NutricionPDFGenerator:
    def __init__(self):
        self.project_root = Path(__file__).parent.parent
        self.data_dir = self.project_root / "data"
        self.templates_dir = self.project_root / "templates"
        self.output_dir = self.project_root / "output"
        self.output_dir.mkdir(exist_ok=True)
        
    def load_productos(self):
        """Carga los productos desde el archivo JSON"""
        productos_file = self.data_dir / "productos.json"
        
        if not productos_file.exists():
            print(f"❌ Archivo no encontrado: {productos_file}")
            return []
        
        try:
            with open(productos_file, 'r', encoding='utf-8') as f:
                data = json.load(f)
                print(f"✅ Cargados {len(data['productos'])} productos")
                return data['productos']
        except json.JSONDecodeError as e:
            print(f"❌ Error al parsear JSON: {e}")
            return []
    
    def generate_typst_content(self, producto):
        """Genera contenido Typst dinámico a partir de un producto"""
        processor = DataProcessor(producto)
        return processor.generate_typst_template()
    
    def compile_pdf(self, typst_content, producto_id):
        """Compila contenido Typst a PDF usando typst-cli"""
        typst_file = self.output_dir / f"{producto_id}.typ"
        pdf_file = self.output_dir / f"{producto_id}.pdf"
        
        try:
            # Escribir archivo .typ temporal
            with open(typst_file, 'w', encoding='utf-8') as f:
                f.write(typst_content)
            
            print(f"📝 Archivo Typst creado: {typst_file.name}")
            
            # Compilar con typst
            result = subprocess.run(
                ['typst', 'compile', str(typst_file), str(pdf_file)],
                capture_output=True,
                text=True
            )
            
            if result.returncode == 0:
                print(f"✅ PDF generado: {pdf_file.name}")
                return True
            else:
                print(f"❌ Error en compilación Typst:")
                print(result.stderr)
                return False
                
        except FileNotFoundError:
            print("❌ Error: typst-cli no encontrado. Instala con: cargo install typst-cli")
            return False
        except Exception as e:
            print(f"❌ Error inesperado: {e}")
            return False
    
    def generate_all(self):
        """Genera PDFs para todos los productos"""
        print("\n" + "="*60)
        print("🏭 GENERADOR DE ETIQUETAS NUTRICIONALES")
        print("="*60 + "\n")
        
        productos = self.load_productos()
        
        if not productos:
            print("❌ No hay productos para procesar")
            return False
        
        success_count = 0
        
        for producto in productos:
            print(f"\n📦 Procesando: {producto['nombre']}")
            
            try:
                typst_content = self.generate_typst_content(producto)
                if self.compile_pdf(typst_content, producto['id']):
                    success_count += 1
            except Exception as e:
                print(f"❌ Error procesando {producto['nombre']}: {e}")
        
        print(f"\n" + "="*60)
        print(f"✅ Generación completada: {success_count}/{len(productos)} PDFs creados")
        print(f"📂 Ubicación: {self.output_dir}")
        print("="*60 + "\n")
        
        return success_count == len(productos)

def main():
    generator = NutricionPDFGenerator()
    success = generator.generate_all()
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
