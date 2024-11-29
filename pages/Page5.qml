import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Layouts"
    contents: [
        {
            main: "QML offers a variety of layout managers (like GridLayout, ColumnLayout, and RowLayout) that automatically adjust the placement and size of elements to fit different screen sizes.",
        },
        {
            main: "The layout will <b>adjust the placement</b> of items based on available space."
        }
    ]
}
