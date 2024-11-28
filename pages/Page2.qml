import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "What is responsive design ?"
    contents: [
        {
            main: "What do designers/developers usually care about",
            sub: [
                "The arrangement of the elements (column, row, grid..)",
                "The own size of the elements (images, texts, borders, frames..)",
                "Both, consistently "
            ]
        },
        {
            main: "Because of the diversity within",
            sub: [
                "The size of the screen",
                "The orientation",
                "The pixel density"
            ]
        }
    ]
}
