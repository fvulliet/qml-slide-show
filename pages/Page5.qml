import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Layouts"
    pageNb: 5
    contents: [
        {
            main: "Grid, Row, Column.. can 'automatically' adjust the placement and size of elements to fit",
        },
        {
            main: "This could be tough, many parameters must be considered !",
        },
    ]
    image: "qrc:/images/layout.png"
    imageRatio: 1/2
}
