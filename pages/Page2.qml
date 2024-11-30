import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "What is responsive design ?"
    contents: [
        {
            main: "QML provides convenient tools to handle visual elements' properties",
            sub: [
                "dimensions",
                "position",
                "layout (arrangement)",
                "visibility",
                "..."
            ]
        },
        {
            main: "Because we could have multiple",
            sub: [
                "screen size",
                "orientation",
                "pixel density",
                "accessibility (disabled people)",
                "..."
            ]
        }
    ]
}
