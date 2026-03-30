// #import "@preview/table:0.0.8": table, table.cell

#let thick-line = stroke(2pt + black)
#let thin-line = stroke(1pt + gray)

#set page(
  paper: "a4",
  margin: (top: 0.5cm, bottom: 0.5cm, left: 0.5cm, right: 2cm),
  numbering: none,
)

#set text(font: "Arial", size: 11pt, lang: "es")

#let rotatex(body, angle: -90deg) = context {
  let size = measure(body)
  box(
    inset: (
      x: -size.width/2 + (size.width * calc.abs(calc.cos(angle)) + size.height * calc.abs(calc.sin(angle))) / 2,
      y: -size.height/2 + (size.height * calc.abs(calc.cos(angle)) + size.width * calc.abs(calc.sin(angle))) / 2
    ),
    rotate(body, angle)
  )
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
        
        #text(size: 10pt, weight: "bold")[Tamaño de porción: 1/4 de taza Porción (50 g)]
        
        #text(size: 10pt, weight: "bold")[Número de porciones por envase: 10]
        
        // Tabla 1: Calórias
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              table.cell( [*Calórias (kcal)*]),
              table.cell( [*Por 100g*]),
              table.cell( [*Por porción*]),
              
              table.cell( align: left, [*Valor*]),
              table.cell( [336]),
              table.cell( [168]),
            )
          ]
        )
        
        // Tabla 2: Grasas
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              table.cell( [*Grasa total*]),
              table.cell( [0.4 g]),
              table.cell( [0.2 g]),
              
              table.cell( [*Grasa saturada*]),
              table.cell( [0.2 g]),
              table.cell( [0.1 g]),
              
              table.cell( [*Grasa Trans*]),
              table.cell( [0 mg]),
              table.cell( [0 mg]),
            )
          ]
        )
        
        // Tabla 3: Carbohidratos
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              table.cell( [*Carbohidratos totales*]),
              table.cell( [79 g]),
              table.cell( [39 g]),
              
              table.cell( [*Fibra dietaria*]),
              table.cell( [3.3 g]),
              table.cell( [1.6 g]),
              
              table.cell( [*Azúcares totales*]),
              table.cell( [3.2 g]),
              table.cell( [1.7 g]),
            )
          ]
        )
        
        // Tabla 4: Azúcares Añadidos
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              table.cell( [*Azúcares Añadidos*]),
              table.cell( [0 g]),
              table.cell( [0 g]),
            )
          ]
        )
        
        // Tabla 5: Proteína
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              table.cell( [*Proteína*]),
              table.cell( [4.1 g]),
              table.cell( [2.1 g]),
            )
          ]
        )
        
        // Tabla 6: Sodio
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              table.cell( [*Sodio*]),
              table.cell( [0.0 g]),
              table.cell( [0.0 g]),
            )
          ]
        )
        
        // Tabla 7: Vitaminas y Minerales
        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.5fr, 1fr, 1fr),
              align: center,
              
              table.cell( [*Vitamina A*]),
              table.cell( [0 µg ER]),
              table.cell( [0 µg ER]),
              
              table.cell( [*Vitamina D*]),
              table.cell( [0 µg]),
              table.cell( [0 µg]),
              
              table.cell( [*Hierro*]),
              table.cell( [2 mg]),
              table.cell( [1 mg]),
              
              table.cell( [*Calcio*]),
              table.cell( [0 mg]),
              table.cell( [0 mg]),
              
              table.cell( [*Zinc*]),
              table.cell( [18 mg]),
              table.cell( [8.8 mg]),
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
      height: 19.1cm,
      stroke: thick-line,
      inset: 8pt,
      rotatex(angle: -90deg)[
          *INGREDIENTES:* Plátano verde deshidratado y molido, Sin aditivos ni conservantes *ALÉRGENOS*: sin alérgenos\ comunes declarados. Mezclar en bebidas, productos horneados o postres. Usar 1-2 cucharadas por taza *Fabricante*:\ Asorepp. País: Colombia
          Conservación: Mantener en lugar fresco, seco y protegido de la humedad
          
          
        ]
//      
    )
  ]
)
