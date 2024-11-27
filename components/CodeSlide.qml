pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

Page {
    id: root

    property alias title: titleText.text
    property string code
    property alias dynamicComp: loader.sourceComponent

    FontLoader {
        id: webFont
        source: "qrc:/fonts/fa-solid-900.ttf"
    }

    Column {
        anchors {
            fill: parent
            margins: 16
        }
        spacing: root.isSmallScreen ? 24 : 48

        Item {
            id: titleContainer

            width: parent.width; height: root.isSmallScreen ? 40 : 80

            Text {
                id: titleText
                font {
                    family: "Helvetica"
                    pixelSize: parent.height
                    bold: true
                }
            }
        }

        Row {
            id: bodyContainer

            width: parent.width; height: parent.height - titleContainer.height - parent.spacing

            Item {
                height: parent.height
                width: root.isSmallScreen ? 0 : (parent.width-parent.spacing)/2
                visible: width > 0

                Text {
                    anchors.fill: parent
                    text: root.code
                    font {
                        pixelSize: 36
                        family: "Courier"
                        bold: true
                    }
                }
            }
            Loader  {
                id: loader
                height: parent.height
                width: root.isSmallScreen ? parent.width : (parent.width-parent.spacing)/2
            }
        }
    }

}
