import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Anchors"
    pageNb: 7
    contents: [
        {
            main: "Anchors allow components to be <b>anytime</b> positioned relative to each other or their container",
        },
        {
            main: "So, components <b>stretch</b> without manually managing sizes and positions"
        }
    ]
    image: "qrc:/images/anchor.png"
    imageRatio: 1/3
}
