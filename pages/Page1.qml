import QtQuick
import QtQuick.Layouts
import "../components" as Components

Components.TextSlide {
    id: root

    title: "What is responsive design ?"
    pageNb: 1
    contents: [
        {
            main: "An approach that ensures a UI adjusts whatever the device and screen size",
        },
        {
            main: "This allows to use <b>the same code</b> regardless of display considerations."
        }
    ]

    GridLayout {
        width: parent.width - 20
        height: (parent.height-20)*3/5
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }
        columns: root.viewport === 0 ? 2 : 3

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "qrc:/images/narrow.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "qrc:/images/medium.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "qrc:/images/wide.png"
            fillMode: Image.PreserveAspectFit
        }
    }
}
