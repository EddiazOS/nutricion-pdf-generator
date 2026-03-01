#import "@preview/tablex:0.0.8": tablex, cellx

#let thick-line = stroke(2pt + black)
#let thin-line = stroke(1pt + gray)

#set page(
  paper: "a4",
  margin: (top: 0.5cm, bottom: 0.5cm, left: 0.5cm, right: 2cm),
  numbering: none,
)

#set text(font: "Arial", size: 11pt, lang: "es")

#let rotated-text(content) = {
  rotate(90deg, origin: center, {
    set text(size: 9pt)
    content
  })
}

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
        
        #text(size: 10pt, weight: "bold")[Tamaño de porción: 1 cucharadita (3 g)]
        
        #text(size: 10pt, weight: "bold")[Número de porciones por envase: 20]
        
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
              
              cellx(stroke: none, align: left, [*342*]),
              cellx(stroke: none, [*342*]),
              cellx(stroke: none, [*10*]),
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
              cellx(stroke: none, [1.3 g]),
              cellx(stroke: none, [0 g]),
              
              cellx(stroke: none, [*Grasa saturada*]),
              cellx(stroke: none, [0.72 g]),
              cellx(stroke: none, [0 g]),
              
              cellx(stroke: none, [*Grasa Trans*]),
              cellx(stroke: none, [0 mg]),
              cellx(stroke: none, [0 mg]),
            )
          ]
        )
        
        // Tabla 3: Carbohhidratos
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #tablex(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              cellx(stroke: none, [*Carbohidratos totales*]),
              cellx(stroke: none, [74 g]),
              cellx(stroke: none, [2.2 g]),
              
              cellx(stroke: none, [*Fibra dietaria*]),
              cellx(stroke: none, [23 g]),
              cellx(stroke: none, [0.68 g]),
              
              cellx(stroke: none, [*Azúcares totales*]),
              cellx(stroke: none, [7.5 g]),
              cellx(stroke: none, [0.23 g]),
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
              cellx(stroke: none, [0 g]),
              cellx(stroke: none, [0 g]),
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
              cellx(stroke: none, [8.5 g]),
              cellx(stroke: none, [0.26 g]),
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
              cellx(stroke: none, [13 mg]),
              cellx(stroke: none, [0.40 mg]),
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
              cellx(stroke: none, [23 mg]),
              cellx(stroke: none, [0.68 mg]),
              
              cellx(stroke: none, [*Calcio*]),
              cellx(stroke: none, [177 mg]),
              cellx(stroke: none, [5.3 mg]),
              
              cellx(stroke: none, [*Zinc*]),
              cellx(stroke: none, [4.5 mg]),
              cellx(stroke: none, [0.14 mg]),
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
            
            #text(size: 8pt)[Avena integral, miel, aceite de girasol, almendras, arándanos secos, semillas de chía, sal marina]
            
            #v(1cm)
            
            #text(weight: "bold", size: 10pt)[ALÉRGENOS]
            
            #text(size: 8pt)[Contiene almendras (frutos secos). Puede contener trazas de: cacahuete, otros frutos secos, sésamo]
            
            #v(1cm)
            
            #text(weight: "bold", size: 10pt)[MODO DE USO]
            
            #text(size: 8pt)[Consumir una cucharadita diaria. Ideal para desayunos, yogures o smoothies.]
            
            #v(1cm)
            
            #text(weight: "bold", size: 10pt)[REFERENCIAS]
            
            #text(size: 7pt)[
              Fabricante: Tu Empresa S.A.\
              País: Colombia\
              Lote: 202601-A\
              Vencimiento: 12 meses\
              Conservación: Lugar fresco y seco
            ]
          ])
        ])
      ]
    )
  ]
)
