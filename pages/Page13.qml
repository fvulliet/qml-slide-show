import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Math"
    contents: [
        {
            main: "We can use the javascipt Math module, combined with ternary operator, to shape some parts of the UI."
        },
        {
            main: "for example, using <b>height: Math.min(42, container.height)</b> will ensure the elements fits its container but never more than 42"
        }
    ]
}
