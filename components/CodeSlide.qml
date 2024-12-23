pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import ThemesModule

Slide {
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
            margins: 48
        }
        spacing: root.viewport === 0 ? 40 : 80

        Text {
            id: titleText
            width: parent.width
            font {
                family: "reMarkableSans-Regular"
                pixelSize: root.viewport === 0 ? 40 : 80
                bold: true
            }
            color: Themes.style_darkestColor
            wrapMode: Text.WordWrap
        }

        Row {
            id: bodyContainer

            width: parent.width; height: parent.height - titleText.implicitHeight - parent.spacing

            Item {
                id: codeItem
                height: parent.height
                width: root.viewport === 0 ? 0 : (parent.width-spare.width-parent.spacing)/2
                visible: width > 0

                Text {
                    anchors.fill: parent
                    text: root.code
                    font {
                        pixelSize: 28
                        family: "Courier"
                        bold: true
                    }
                    wrapMode: Text.WordWrap
                    color: "#6A737B"
                }
            }
            Item {
                // this allows the measured value to be displayed even if codeItem is not visible
                id: spare
                height: parent.height
                width: root.viewport === 0 ? 40 : 0
            }
            Loader  {
                id: loader
                height: parent.height
                width: root.viewport === 0 ? parent.width-spare.width : (parent.width-parent.spacing)/2
            }
        }
    }
}
