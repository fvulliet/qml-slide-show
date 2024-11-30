import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Dynamic content management"
    pageNb: 15
    contents: [
        {
            main: "One can dynamically load or change content depending on the screen size or orientation",
            sub: [
                "for example, using a Loader + conditions on the source"
            ]
        }
    ]
}
