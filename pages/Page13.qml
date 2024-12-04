import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "UI-logic"
    pageNb: 13
    contents: [
        {
            main: "use <b>Javascript</b> to implement UI rules and conditional <b>behaviors</b>",
            sub: [
                "\"Math\" module",
                "ternary operator",
                "..."
            ]
        }
    ]
    image: "qrc:/images/logic.png"
    imageRatio: 1/3
}
