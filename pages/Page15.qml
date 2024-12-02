import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Dynamic content management"
    pageNb: 15
    contents: [
        {
            main: "You can dynamically load or change any content depending on the display properties",
            sub: [
                "for example, using a Loader + conditions on its source property"
            ]
        }
    ]
}
