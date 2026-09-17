1. About Gaussian grids:

flowchart TD
    A([Gaussian grid<br/>Gaussian latitude positions])

    A --> B([Full Gaussian])
    B --> B1[Same number of<br/>longitude points everywhere]

    A --> C([Reduced Gaussian])
    C --> C1[Fewer longitude points<br/>towards the poles]
    C --> D([Octahedral])
    D --> D1[Specific systematic rule<br/>for longitude reduction]

    E([Regular lat–lon<br/>equally spaced latitudes]):::different

    classDef different stroke-dasharray: 5 5;


