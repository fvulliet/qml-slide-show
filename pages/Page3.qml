import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Declarative syntax & bindings"
    pageNb: 3
    contents: [
        {
            main: "QML relies on <b>Components</b> that come with a set of properties",
            sub: [
                "a <b>property</b> describes how the component should look like",
                "it's coded in a declarative way, like <b>myProperty: 42</b>"
            ]
        },
        {
            main: "<b>Bindings</b> allow properties to depend on each other",
            sub: [
                "this ensures that a component <b>resizes relative</b> to other properties (e.g its container's dimensions)"
            ]
        }
    ]
    image: "qrc:/images/qml2.png"
}
