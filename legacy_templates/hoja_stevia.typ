// #import "@preview/table:0.0.8": table, table.cell

#let thick-line = stroke(2pt + black)
#let thin-line = stroke(1pt + gray)

#set page(
  paper: "a4",
  margin: (top: 0.5cm, bottom: 0.5cm, left: 0.5cm, right: 2cm),
  numbering: none,
)

#set text(size: 11pt, lang: "es")

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
        
        #text(size: 10pt, weight: "bold")[Tamaño de porción: 1 Porción (1.0 g)]
        
        #text(size: 10pt, weight: "bold")[Número de porciones por envase: 20]
        
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
              table.cell( [303]),
              table.cell( [3.0]),
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
              table.cell( [3.8 g]),
              table.cell( [0.04 g])
             
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
              table.cell( [58.8 g]),
              table.cell( [0.59 g]),
              
              table.cell( [*Fibra dietaria*]),
              table.cell( [7.9 g]),
              table.cell( [0.08 g]),
              
              table.cell( [*Azúcares totales*]),
              table.cell( [0 g]),
              table.cell( [0 g]),
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
              table.cell( [16.2 g]),
              table.cell( [0.16 g]),
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
              table.cell( [102.9 mg]),
              table.cell( [3.6 mg]),
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
       
              table.cell( [*Hierro*]),
              table.cell( [297.9 mg]),
              table.cell( [3.0 mg]),
              
              table.cell( [*Calcio*]),
              table.cell( [360 mg]),
              table.cell( [3.6 mg]),
              
              table.cell( [*Zinc*]),
              table.cell( [3.7 mg]),
              table.cell( [0.04 mg]),

              table.cell([*Potasio*]),
              table.cell([347.4 mg]),
              table.cell([3.5 mg]),

              table.cell([*Magnesio*]),
              table.cell([324.1 mg]),
              table.cell([3.2 mg])
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
      rotatex[*INGREDIENTES:* Hojas de Estevia deshidratada, 100% natural. *ALÉRGENOS:* Sin alérgenos comunes declarados.\ Apto para diabéticos. *MODO DE USO* Endulzante natural. usar media cucharadita por taza de bebida. Sin calorías.\ *REFERENCIAS* Fabricante: Estevwaji. *CONSERVACIÓN*: mantener en un lugar fresco y seco, en envase hermético.]
    )
  ]
)
