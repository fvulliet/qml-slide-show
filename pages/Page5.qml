import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Layouts"
    pageNb: 5
    contents: [
        {
            main: "Grid, Row, Column.. can \"automatically\" adjust the <b>placement and size</b> of elements to fit"
        }
    ]
    image: "qrc:/images/layout.png"
    imageRatio: 1/2
}
