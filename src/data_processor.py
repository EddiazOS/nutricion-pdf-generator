# -*- coding: utf-8 -*-
"""
Procesador de datos nutricionales
Transforma datos JSON en templates Typst dinámicos
"""

from typing import Dict, List, Any

class DataProcessor:
    def __init__(self, producto: Dict[str, Any]):
        self.producto = producto
        self.nutrientes = producto.get('nutrientes', {})
        self.ingredientes = producto.get('ingredientes', [])
        self.alergenicos = producto.get('alergenicos', [])
        self.modo_uso = producto.get('modo_uso', '')
        self.referencias = producto.get('referencias', {})
    
    def format_number(self, value):
        """Formatea números para mostrar en la etiqueta"""
        if isinstance(value, (int, float)):
            if value == 0:
                return "0"
            elif value < 1:
                return f"{value:.2f}".rstrip('0').rstrip('.')
            else:
                return f"{value:.1f}".rstrip('0').rstrip('.')
        return str(value)
    
    def get_ingredientes_text(self) -> str:
        """Genera texto de ingredientes"""
        if not self.ingredientes:
            return "No especificado"
        return ", ".join(self.ingredientes)
    
    def get_alergenicos_text(self) -> str:
        """Genera texto de alérgenos"""
        if not self.alergenicos:
            return "No contiene alérgenos comunes"
        return "\n".join([f"• {alergen}" for alergen in self.alergenicos])
    
    def get_referencias_text(self) -> str:
        """Genera texto de referencias"""
        lineas = []
        
        if self.referencias.get('fabricante'):
            lineas.append(f"Fabricante: {self.referencias['fabricante']}")
        if self.referencias.get('pais_origen'):
            lineas.append(f"País: {self.referencias['pais_origen']}")
        if self.referencias.get('lote'):
            lineas.append(f"Lote: {self.referencias['lote']}")
        if self.referencias.get('vencimiento'):
            lineas.append(f"Vencimiento: {self.referencias['vencimiento']}")
        if self.referencias.get('conservacion'):
            lineas.append(f"Conservación: {self.referencias['conservacion']}")
        
        return "\\\n".join(lineas) if lineas else "No especificado"
    
    def generate_typst_template(self) -> str:
        """
        Genera el template Typst completo con todos los datos
        """
        
        # Obtener valores nutricionales
        energia_100g = self.format_number(self.nutrientes.get('energia_kcal_100g', 0))
        energia_porcion = self.format_number(self.nutrientes.get('energia_kcal_porcion', 0))
        
        grasa_total_100g = self.format_number(self.nutrientes.get('grasa_total_100g', 0))
        grasa_total_porcion = self.format_number(self.nutrientes.get('grasa_total_porcion', 0))
        
        grasa_sat_100g = self.format_number(self.nutrientes.get('grasa_saturada_100g', 0))
        grasa_sat_porcion = self.format_number(self.nutrientes.get('grasa_saturada_porcion', 0))
        
        carbos_100g = self.format_number(self.nutrientes.get('carbohidratos_100g', 0))
        carbos_porcion = self.format_number(self.nutrientes.get('carbohidratos_porcion', 0))
        
        fibra_100g = self.format_number(self.nutrientes.get('fibra_dietaria_100g', 0))
        fibra_porcion = self.format_number(self.nutrientes.get('fibra_dietaria_porcion', 0))
        
        azucares_100g = self.format_number(self.nutrientes.get('azucares_totales_100g', 0))
        azucares_porcion = self.format_number(self.nutrientes.get('azucares_totales_porcion', 0))
        
        azucares_anadidos = self.format_number(self.nutrientes.get('azucares_anadidos', 0))
        
        proteina_100g = self.format_number(self.nutrientes.get('proteina_100g', 0))
        proteina_porcion = self.format_number(self.nutrientes.get('proteina_porcion', 0))
        
        sodio_100g = self.format_number(self.nutrientes.get('sodio_mg_100g', 0))
        sodio_porcion = self.format_number(self.nutrientes.get('sodio_mg_porcion', 0))
        
        hierro_100g = self.format_number(self.nutrientes.get('hierro_mg_100g', 0))
        hierro_porcion = self.format_number(self.nutrientes.get('hierro_mg_porcion', 0))
        
        calcio_100g = self.format_number(self.nutrientes.get('calcio_mg_100g', 0))
        calcio_porcion = self.format_number(self.nutrientes.get('calcio_mg_porcion', 0))
        
        zinc_100g = self.format_number(self.nutrientes.get('zinc_mg_100g', 0))
        zinc_porcion = self.format_number(self.nutrientes.get('zinc_mg_porcion', 0))
        
        # Obtener textos procesados
        ingredientes_text = self.get_ingredientes_text()
        alergenicos_text = self.get_alergenicos_text()
        referencias_text = self.get_referencias_text()
        
        template = f'''#import "@preview/tablex:0.0.8": tablex, cellx

#let thick-line = stroke(2pt + black)
#let thin-line = stroke(1pt + gray)

#set page(
  paper: "a4",
  margin: (top: 0.5cm, bottom: 0.5cm, left: 0.5cm, right: 2cm),
  numbering: none,
)

#set text(font: "Arial", size: 11pt, lang: "es")

#let rotated-text(content) = {{
  rotate(90deg, origin: center, {{
    set text(size: 9pt)
    content
  }})
}}

#grid(
  columns: (1fr, 2.5cm),
  column-gutter: 0.3cm,
  [
    // SECCIÓN PRINCIPAL
    #box(
      stroke: thick-line,
      inset: 10pt,
      [
        == Información Nutricional
        
        #text(size: 10pt, weight: "bold")[Tamaño de porción: {self.producto['tamanio_porcion']}]
        
        #text(size: 10pt, weight: "bold")[Número de porciones por envase: {self.producto['porciones_envase']}]
        
        // Tabla 1: Calórias
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #tablex(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              cellx(stroke: none, [*Calórias (kcal)*]),
              cellx(stroke: none, [*Por 100g*]),
              cellx(stroke: none, [*Por porción*]),
              
              cellx(stroke: none, align: left, [*Valor*]),
              cellx(stroke: none, [{energia_100g}]),
              cellx(stroke: none, [{energia_porcion}]),
            )
          ]
        )
        
        // Tabla 2: Grasas
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #tablex(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              cellx(stroke: none, [*Grasa total*]),
              cellx(stroke: none, [{grasa_total_100g} g]),
              cellx(stroke: none, [{grasa_total_porcion} g]),
              
              cellx(stroke: none, [*Grasa saturada*]),
              cellx(stroke: none, [{grasa_sat_100g} g]),
              cellx(stroke: none, [{grasa_sat_porcion} g]),
              
              cellx(stroke: none, [*Grasa Trans*]),
              cellx(stroke: none, [0 mg]),
              cellx(stroke: none, [0 mg]),
            )
          ]
        )
        
        // Tabla 3: Carbohidratos
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #tablex(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              cellx(stroke: none, [*Carbohidratos totales*]),
              cellx(stroke: none, [{carbos_100g} g]),
              cellx(stroke: none, [{carbos_porcion} g]),
              
              cellx(stroke: none, [*Fibra dietaria*]),
              cellx(stroke: none, [{fibra_100g} g]),
              cellx(stroke: none, [{fibra_porcion} g]),
              
              cellx(stroke: none, [*Azúcares totales*]),
              cellx(stroke: none, [{azucares_100g} g]),
              cellx(stroke: none, [{azucares_porcion} g]),
            )
          ]
        )
        
        // Tabla 4: Azúcares Añadidos
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #tablex(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              cellx(stroke: none, [*Azúcares Añadidos*]),
              cellx(stroke: none, [{azucares_anadidos} g]),
              cellx(stroke: none, [{azucares_anadidos} g]),
            )
          ]
        )
        
        // Tabla 5: Proteína
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #tablex(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              cellx(stroke: none, [*Proteína*]),
              cellx(stroke: none, [{proteina_100g} g]),
              cellx(stroke: none, [{proteina_porcion} g]),
            )
          ]
        )
        
        // Tabla 6: Sodio
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #tablex(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              cellx(stroke: none, [*Sodio*]),
              cellx(stroke: none, [{sodio_100g} mg]),
              cellx(stroke: none, [{sodio_porcion} mg]),
            )
          ]
        )
        
        // Tabla 7: Vitaminas y Minerales
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #tablex(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              cellx(stroke: none, [*Vitamina A*]),
              cellx(stroke: none, [0 µg ER]),
              cellx(stroke: none, [0 µg ER]),
              
              cellx(stroke: none, [*Vitamina D*]),
              cellx(stroke: none, [0 µg]),
              cellx(stroke: none, [0 µg]),
              
              cellx(stroke: none, [*Hierro*]),
              cellx(stroke: none, [{hierro_100g} mg]),
              cellx(stroke: none, [{hierro_porcion} mg]),
              
              cellx(stroke: none, [*Calcio*]),
              cellx(stroke: none, [{calcio_100g} mg]),
              cellx(stroke: none, [{calcio_porcion} mg]),
              
              cellx(stroke: none, [*Zinc*]),
              cellx(stroke: none, [{zinc_100g} mg]),
              cellx(stroke: none, [{zinc_porcion} mg]),
            )
          ]
        )
      ]
    )
  ],
  [
    // SECCIÓN DERECHA ROTADA
    #box(
      width: 100%,
      height: 29.5cm,
      stroke: thick-line,
      inset: 8pt,
      [
        #rotated-text([
          #box(width: 100%, [
            #text(weight: "bold", size: 10pt)[INGREDIENTES]
            
            #text(size: 8pt)[{ingredientes_text}]
            
            #v(1cm)
            
            #text(weight: "bold", size: 10pt)[ALÉRGENOS]
            
            #text(size: 8pt)[
              {alergenicos_text}
            ]
            
            #v(1cm)
            
            #text(weight: "bold", size: 10pt)[MODO DE USO]
            
            #text(size: 8pt)[{self.modo_uso}]
            
            #v(1cm)
            
            #text(weight: "bold", size: 10pt)[REFERENCIAS]
            
            #text(size: 7pt)[
              {referencias_text}
            ]
          ])
        ])
      ]
    )
  ]
)
'''
        return template
