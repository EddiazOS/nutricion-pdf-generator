

#let thick-line = stroke(2pt + black)
#let thin-line = stroke(1pt + gray)

#set page(
  paper: "a4",
  margin: (top: 0.5cm, bottom: 0.5cm, left: 0.5cm, right: 2cm),
  numbering: none,
)

#set text(font: "Arial", size: 11pt, lang: "es")

// #let rotated-text(content) = {
//   rotate(270deg, origin: center, {
//     set text(size: 9pt)
//     content
//   })
// }
// 
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
        
        #text(size: 10pt, weight: "bold")[Tamaño de porción: 1 cdta (15 g)]
        
        #text(size: 10pt, weight: "bold")[Número de porciones por envase: 33]
        
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
              table.cell( [*Por porción (15g)*]),
              
              table.cell( align: left, [*Totales*]),
              table.cell( [370]),
              table.cell( [56]),
              table.cell(align: left, [*Cal Grasa*]),
              table.cell([360]),
              table.cell([54])
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
              table.cell( [40]),
              table.cell( [6 g]),
              
              table.cell( [*Grasa saturada*]),
              table.cell( [6.67 g]),
              table.cell( [1 g]),
              
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
              table.cell( [ 3.50 g]),
              table.cell( [ 0.53 g]),
              
              table.cell( [*Fibra dietaria*]),
              table.cell( [0.30 g]),
              table.cell( [0.04 g]),
              
              table.cell( [*Azúcares totales*]),
              table.cell( [0.50 g]),
              table.cell( [0.07 g]),
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
              table.cell( [1.15 g]),
              table.cell( [0.17 g]),
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
              table.cell( [388 mg]),
              table.cell( [58 mg]),
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
              table.cell( [32.00 µg ER]),
              table.cell( [4.80 µg ER]),
              
              table.cell( [*Vitamina C*]),
              table.cell( [10.98 µg]),
              table.cell( [1.65 µg]),

              table.cell( [*Vitamina E*]),
              table.cell( [5.81 µg]),
              table.cell( [0.87 µg]),

              table.cell( [*Vitamina K*]),
              table.cell( [74.12 µg]),
              table.cell( [11.12 µg]),
              
              table.cell( [*Hierro*]),
              table.cell( [0.15 mg]),
              table.cell( [0.02 mg]),
              
              table.cell( [*Calcio*]),
              table.cell( [36.45 mg]),
              table.cell( [5.47 mg]),
              
              table.cell( [*Potasio*]),
              table.cell( [96.20 mg]),
              table.cell( [14.43 mg]),
            )
          ]
        )
      ]
    )
  ],
  [
    // SECCIÓN DERECHA ROTADA
    #rect(
      width: 110%,
      height: 19cm,
      stroke: thick-line,
      inset: 8pt)[
        #rotatex(angle: -90deg)[
          *INGREDIENTES:* Berro, cebolla roja, cabolla larga, ajo, aceite de oliva, vinagre sal *ALÉRGENOS*: Sin alérgenos\ comunes decla rados. Usar como condimiento en carnes y vegetales. Una cucharadita por porción. *Fabricante:* \ *Berros la cumbre.*  Conservación: Mantener en lugar fresco y seco, protegido de la luz. 
          
          
        ]
      ]
    
  ]
)
