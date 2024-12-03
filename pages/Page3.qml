import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Components, properties & bindings"
    pageNb: 3
    contents: [
        {
            main: "QML relies on <b>Components</b>, with a large set of properties",
            sub: [
                "a <b>property</b> describes how the component should look like",
            ]
        },
        {
            main: "<b>Bindings</b> allow properties to depend on each other",
            sub: [
                "hence a component can <b>resize relative</b> to other properties (e.g: dimensions)"
            ]
        }
    ]
    image: "qrc:/images/qml2.png"
}
