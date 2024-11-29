import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Declarative syntax"
    contents: [
        {
            main: "Describe what the UI should look like and how it behaves. It’s “easy” to define responsive behavior and layouts.",
        },
        {
            main: "This ensures that the element <b>resizes relative</b> to its parent, adapting to changes in screen size."
        }
    ]
}
