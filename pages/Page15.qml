import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Dynamic content management"
    pageNb: 15
    contents: [
        {
            main: "You can <b>dynamically load</b> or change Components depending on the display properties",
            sub: [
                "for example, using a <b>Loader</b> + conditions on its source property"
            ]
        }
    ]
}
