Mermaid diagram code and style config.
======================================

Code:
-----

graph TD
    A("So we can adapt as necessary to keep the planet and its populations safe<br>and healthy <b>it's crucial that we understand (the Earth's) climate.</b>")
    --o C("Therefore we <b>need to study climate science and<br>make useful predictions</b> about future scenarios.")
    C --o D("<b>Planetary systems are incredibly complicated, the Earth<br>especially</b> due to the presence of humans with our large-scale<br>environmentally-disruptive activity and unpredictable behaviour!")
    D --o E["We <b>need highly-sophisticated models, and e.g. to run these in ensembles</b>,<br>to generate projections of the Earth's future behaviour that are sufficiently useful."]
    E --o F("We <b>require state-of-the-art supercomputers with adequate<br>(high!) computational performance</b> to run such models.")
    F --o G("Also <b>we need to study and advance HPC hardware and its<br>optimised use</b> to continue to run the increasingly intensive simulations.")
    
    C -.-o X("From this we know we need<br>to reduce energy consumption.")
    -.-o L

    L("Supercomputers need much energy<br>to run at a given performance...") -.-o F
    Q("...that's a 'necessary evil' and we should<br>aim to minimise the carbon footprint.") -.-o H
    G --o H("<i>It is really useful to survey the machines used,<br>and performance attained, in recent climate model runs.<i>")
    F --o H
    L -.-o Q

    classDef MAIN fill:#f3e6ff,stroke:#000,stroke-width:1px;
    classDef ENDP fill:#dab3ff,stroke:#000,stroke-width:1px;
    classDef SUB fill:#e6f2ff,stroke-width:1px;
    class B,C,D,E,F,G MAIN
    class A,H ENDP
    class L,Q,X SUB

    linkStyle default stroke-width:5px;
    linkStyle 5,6,7,8,9,10,11 stroke-width:5px;


Style configuration:
--------------------

{
  "theme": "neutral",
  "themeVariables": {
    "arrowHeadColor": "#000000",
    "nodeBorder": "#000000",
    "fontFamily": "arial",
    "fontSize": "35px"
  }
}

