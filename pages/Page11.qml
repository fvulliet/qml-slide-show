import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Screen and DPI* considerations"
    contents: [
        {
            main: "QML components can be made aware of the screen size and pixel density, allowing for more precise adjustments. You can retrieve information like the screen width, height, and DPI using the Screen object.",
        },
        {
            main: "This ensures that the <b>layout adapts<b> based on the device’s screen resolution."
        }
    ]
}
