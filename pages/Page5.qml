import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Layouts"
    pageNb: 5
    contents: [
        {
            main: "Grid, Row, Column.. they can 'automatically' adjust the placement and size of elements to fit",
        },
        {
            main: "This is not black magic and could be tough, there are many parameters to consider !",
        },
    ]
}
