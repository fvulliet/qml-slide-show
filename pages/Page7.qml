import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Anchors"
    contents: [
        {
            main: "Anchors allow elements to be positioned relative to each other or their container.\nThis makes it easy to create responsive interfaces without manually managing sizes and positions.",
        },
        {
            main: "The rectangle <b>stretches</b> to the full width of its parent, adapting to different screen sizes."
        }
    ]
}
