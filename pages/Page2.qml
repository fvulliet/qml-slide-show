import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "QML, in a nutshell"
    pageNb: 2
    contents: [
        {
            main: "a programming language, part of <b>Qt framework</b>",
            sub: [
                "suitable for UIs",
                "supports Javascript to bring some logic"
            ]
        },
        {
            main: "QML provides convenient <b>tools</b> to handle visual components' <b>properties</b>",
            sub: [
                "dimensions",
                "position",
                "layout",
                "visibility...",
            ]
        },
        {
            main: "Why such a tool ? Because of the <b>diversity</b> of",
            sub: [
                "screen size",
                "orientation",
                "pixel density",
                "fonts",
                "colors...",
            ]
        }
    ]
    image: "qrc:/images/qml2.png"
}
