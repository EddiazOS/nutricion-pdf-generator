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

#let producto = yaml("data/aceite_coco_200ml.yaml")

#grid(
  columns: (1fr, 2.5cm),
  column-gutter: 0.3cm,
  [
    #box(
      stroke: thick-line,
      inset: 10pt,
      [
        == Información Nutricional

        #text(size: 10pt, weight: "bold")[
          Tamaño de porción: #(producto.porcion_texto)
        ]

        #text(size: 10pt, weight: "bold")[
          Número de porciones por envase: #(producto.porciones_por_envase)
        ]

        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.8fr, 1fr, 1fr),
              align: center,

              table.cell([*Calorías (kcal)*]),
              table.cell([*Por 100 mL*]),
              table.cell([*Por porción*]),

              table.cell(align: left, [*Totales*]),
              table.cell([#(producto.nutricion.calorias_100ml)]),
              table.cell([#(producto.nutricion.calorias_porcion)]),

              table.cell(align: left, [*Calorías de grasa*]),
              table.cell([#(producto.nutricion.calorias_grasa_100ml)]),
              table.cell([#(producto.nutricion.calorias_grasa_porcion)]),
            )
          ]
        )

        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.8fr, 1fr, 1fr),
              align: center,

              table.cell([*Grasa total*]),
              table.cell([#(producto.nutricion.grasa_total_100ml)]),
              table.cell([#(producto.nutricion.grasa_total_porcion)]),

              table.cell([*Grasa saturada*]),
              table.cell([#(producto.nutricion.grasa_saturada_100ml)]),
              table.cell([#(producto.nutricion.grasa_saturada_porcion)]),

              table.cell([*Grasa trans*]),
              table.cell([#(producto.nutricion.grasa_trans_100ml)]),
              table.cell([#(producto.nutricion.grasa_trans_porcion)]),

              table.cell([*Grasa monoinsaturada*]),
              table.cell([#(producto.nutricion.grasa_mono_100ml)]),
              table.cell([#(producto.nutricion.grasa_mono_porcion)]),

              table.cell([*Grasa poliinsaturada*]),
              table.cell([#(producto.nutricion.grasa_poli_100ml)]),
              table.cell([#(producto.nutricion.grasa_poli_porcion)]),
            )
          ]
        )

        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.8fr, 1fr, 1fr),
              align: center,

              table.cell([*Carbohidratos totales*]),
              table.cell([#(producto.nutricion.carbohidratos_100ml)]),
              table.cell([#(producto.nutricion.carbohidratos_porcion)]),

              table.cell([*Fibra dietaria*]),
              table.cell([#(producto.nutricion.fibra_100ml)]),
              table.cell([#(producto.nutricion.fibra_porcion)]),

              table.cell([*Azúcares totales*]),
              table.cell([#(producto.nutricion.azucares_totales_100ml)]),
              table.cell([#(producto.nutricion.azucares_totales_porcion)]),

              table.cell([*Azúcares añadidos*]),
              table.cell([#(producto.nutricion.azucares_anadidos_100ml)]),
              table.cell([#(producto.nutricion.azucares_anadidos_porcion)]),
            )
          ]
        )

        #box(
          stroke: thick-line,
          inset: 8pt,
          [
            #table(
              columns: (1.8fr, 1fr, 1fr),
              align: center,

              table.cell([*Proteína*]),
              table.cell([#(producto.nutricion.proteina_100ml)]),
              table.cell([#(producto.nutricion.proteina_porcion)]),

              table.cell([*Sodio*]),
              table.cell([#(producto.nutricion.sodio_100ml)]),
              table.cell([#(producto.nutricion.sodio_porcion)]),

              table.cell([*Colesterol*]),
              table.cell([#(producto.nutricion.colesterol_100ml)]),
              table.cell([#(producto.nutricion.colesterol_porcion)]),
            )
          ]
        )
      ]
    )
  ],
  [
    #rect(
      width: 110%,
      height: 19cm,
      stroke: thick-line,
      inset: 8pt
    )[
      #rotatex(angle: -90deg)[
        *INGREDIENTES:* #(producto.textos.ingredientes)
        *ALÉRGENOS:* #(producto.textos.alergenos)
        *USO SUGERIDO:* #(producto.textos.uso_sugerido)
        *FABRICANTE:* #(producto.empresa.nombre)
        *ORIGEN:* #(producto.empresa.origen)
        *CONTENIDO NETO:* #(producto.contenido_neto)
        *CONSERVACIÓN:* #(producto.textos.conservacion)
      ]
    ]
  ]
)
