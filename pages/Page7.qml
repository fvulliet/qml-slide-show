import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Anchors"
    pageNb: 7
    contents: [
        {
            main: "Anchors allow components to be positioned relative to each other, or to their container"
        },
        {
            main: "Hence, components <b>stretch</b> without manually managing sizes and positions"
        }
    ]
    image: "qrc:/images/anchor.png"
    imageRatio: 1/3
}
