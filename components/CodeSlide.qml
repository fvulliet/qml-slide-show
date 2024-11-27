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
        spacing: 48

        Item {
            id: titleContainer

            width: parent.width; height: titleText.implicitHeight

            Text {
                id: titleText
                font {
                    family: "Helvetica"
                    pixelSize: 80
                    bold: true
                }
            }
        }

        Row {
            id: bodyContainer

            width: parent.width; height: parent.height - titleContainer.height - parent.spacing

            Item {
                height: parent.height; width: (parent.width-parent.spacing)/2

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
                height: parent.height; width: (parent.width-parent.spacing)/2
            }
        }
    }

}
