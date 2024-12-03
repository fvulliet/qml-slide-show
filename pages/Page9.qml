import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Flickable"
    pageNb: 9
    contents: [
        {
            main: "Show a collection of elements in a <b>size-limited container</b>, with the ability to scroll/flick",
        },
        {
            main: "It also optimizes the memory usage"
        }
    ]
}
