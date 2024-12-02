import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "A few best practices"
    pageNb: 17
    contents: [
        {
            main: "Use implicit and relative sizes (whenever possible)",
            sub: [
                "instead of fixed sizes"
            ]
        },
        {
            main: "Leverage anchors and layouts",
            sub: [
                "use x and y with extreme care"
            ]
        },
        {
            main: "Use Screen size or DPI detection to adjust the UI"
        },
        {
            main: "Trust QML components, they're full of helpful properties !"
        }
    ]
}
