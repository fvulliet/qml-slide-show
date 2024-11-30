import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Layouts"
    pageNb: 6
    code:
    `GridLayout {
        id: "grid
        columns: Math.max(1, Math.floor(parent.width / 100))
        ...
        (the rest is a bit tough here)
    }`
    dynamicComp: Rectangle {
        id: ctnr
        color: "#D0C9C0"
        clip: true

        GridLayout {
            id: grid
            anchors {
                fill: parent
                margins: 10
            }
            columns: Math.max(1, Math.floor(parent.width / 100)) // Adjust columns based on window width
            rowSpacing: 5
            columnSpacing: 5

            Repeater {
                model: 15
                delegate: Rectangle {
                    id: del
                    required property int index
                    width: 100; height: 100
                    color: "#2CDE85"

                    Image {
                        anchors.fill: parent
                        source: "qrc:/images/marsipanpng.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }
    }
}
