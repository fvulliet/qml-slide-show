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
        width: parent.width
        height: parent.height/2
        anchors.bottom: parent.bottom
        columns: root.isSmallScreen ? 2 : 3

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "qrc:/images/chameleon1.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "qrc:/images/chameleon1.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "qrc:/images/chameleon1.png"
            fillMode: Image.PreserveAspectFit
        }
    }
}
