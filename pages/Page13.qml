import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Screen and device adaptation"
    contents: [
        {
            main: "QML provides access to screen and device information through the Qt module (e.g., Qt.platform.os, Screen.pixelDensity, Screen.width, Screen.height)."
        },
        {
            main: "You can use these to adapt the UI for various devices:"
        }

    ]
}
