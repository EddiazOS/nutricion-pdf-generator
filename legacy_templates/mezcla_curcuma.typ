
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
        
        #text(size: 10pt, weight: "bold")[Tamaño de porción: 1 cucharadita (3.0 g)]
        
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
              table.cell( [309]),
              table.cell( [10]),
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
              table.cell( [3.3 g]),
              table.cell( [0.2 g]),
              
              table.cell( [*Grasa saturada*]),
              table.cell( [2.0 g]),
              table.cell( [0.10 g]),
              
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
              table.cell( [66.9 g]),
              table.cell( [2.0 g]),
              
              table.cell( [*Fibra dietaria*]),
              table.cell( [23.1 g]),
              table.cell( [0.5 g]),
              
              table.cell( [*Azúcares totales*]),
              table.cell( [2.9 g]),
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
              table.cell( [10.0 g]),
              table.cell( [0.30 g]),
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
              table.cell( [30 mg]),
              table.cell( [1.0 mg]),
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
              table.cell( [52.8 mg]),
              table.cell( [1.6 mg]),
              
              table.cell( [*Manganeso*]),
              table.cell( [19.7 mg]),
              table.cell( [0.6 mg]),
              
              table.cell( [*Magnesio*]),
              table.cell( [206 mg]),
              table.cell( [6.2 mg]),

              table.cell( [*Potasio*]),
              table.cell( [2.04 g]),
              table.cell( [61 mg]),

              table.cell( [*Calcio*]),
              table.cell( [181.8 mg]),
              table.cell( [5.4 mg]),
              
              table.cell( [*Zinc*]),
              table.cell( [4.8 mg]),
              table.cell( [0 mg]),

              table.cell( [*Vitamina K*]),
              table.cell( [20.6 $mu$g]),
              table.cell( [1.03 $mu$g]),

              table.cell( [*Vitamina E*]),
              table.cell( [3.85 mg]),
              table.cell( [0.19 mg]),

              table.cell( [*Vitamina C*]),
              table.cell( [0.95 mg]),
              table.cell( [0.05 mg]),
            )
          ]
        ),

        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.5fr, 1fr, 1fr),
              align: center + horizon,
              table.cell([*Aceites Volátiles:* (Turmerónas, Curcumenos, sesquiterpenos, etc...)]),
              table.cell([7.60 g]),
              table.cell([280 mg]),

              table.cell([*Piperina*]),
              table.cell([0.45 g]),
              table.cell([13 mg])
            )
          ]
        ),
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
      rotatex[*INGREDIENTES:* Cúrcuma, Pimienta negra. *ALÉRGENOS:* Sin alérgenos comunes declarados. *MODO DE USO:*\ Mezclar en bebidas calientes, platos de arroz, o vegetales. Una cucharadita por porción. *REFERENCIAS* fabricante:\ Cúrcuma y Mariote. *Conservación:* Mantener en un lugar fresco, seco y protegido de la luz solar directa. ]
    )
  ]
)
