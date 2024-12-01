import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "QML in a nutshell"
    pageNb: 2
    contents: [
        {
            main: "QML provides convenient <b>tools</b> to handle visual components' <b>properties</b>",
            sub: [
                "dimensions",
                "position",
                "layout (arrangement)",
                "visibility",
                "..."
            ]
        },
        {
            main: "Because of the <b>diversity</b>",
            sub: [
                "screen size",
                "orientation",
                "pixel density",
                "fonts",
                "colors",
                "..."
            ]
        }
    ]
    image: "qrc:/images/qml2.png"
}
