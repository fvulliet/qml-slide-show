pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

Slide {
    id: root

    property alias title: titleText.text
    property var contents: []
    readonly property int _subElementHeight: isSmallScreen ? 24 : 40

    FontLoader {
        id: webFont
        source: "qrc:/fonts/fa-solid-900.ttf"
    }

    Column {
        anchors {
            fill: parent
            margins: 48
        }
        spacing: root.isSmallScreen ? 24 : 48

        Text {
            id: titleText
            width: parent.width; height: root.isSmallScreen ? 24 : 80
            font {
                family: "reMarkableSans-Regular"
                pixelSize: height
                bold: true
            }
            color: "#2E2E2E"
        }

        ListView {
            id: blocsList
            width: parent.width
            height: parent.height - titleText.height - parent.spacing
            model: root.contents
            spacing: root.isSmallScreen ? 10 : 20
            delegate: Column {
                id: blocDelegate

                required property var modelData
                required property int index
                property var subData: modelData.sub

                width: blocsList.width
                height: myText.implicitHeight + innerListView.height + spacing
                spacing: root.isSmallScreen ? 10 : 20

                Row {
                    width: parent.width
                    height: myText.implicitHeight
                    spacing: 10

                    Text {
                        id: myIcon
                        height: root.isSmallScreen ? 24 : 48
                        width: height
                        anchors.verticalCenter: myText.verticalCenter
                        text: "\u2666"
                        font {
                            family: webFont.name
                            pixelSize: height*0.8
                        }
                        color: "#6A737B"
                    }
                    Text {
                        id: myText
                        width: parent.width - myIcon.width - parent.spacing
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.isSmallScreen ? 24 : 48
                        }
                        wrapMode: Text.WordWrap
                        text: blocDelegate.modelData.main
                        color: "#6A737B"
                    }
                }

                ListView {
                    id: innerListView
                    width: parent.width - root.isSmallScreen ? 24 : 40
                    anchors {
                        left: parent.left
                        leftMargin: root.isSmallScreen ? 24 : 40
                    }
                    height: blocDelegate.subData?.length * root._subElementHeight
                    model: blocDelegate.subData
                    spacing: 0
                    delegate: Row {
                        id: subContent

                        required property string modelData

                        width: innerListView.width
                        height: root._subElementHeight
                        spacing: 10

                        Text {
                            id: mySubIcon
                            height: root.isSmallScreen ? 24 : 48
                            width: height
                            anchors.verticalCenter: mySubText.verticalCenter
                            text: "\u2013"
                            font {
                                family: webFont.name
                                pixelSize: height*0.8
                            }
                            color: "#6A737B"
                        }
                        Text {
                            id: mySubText
                            height: parent.height
                            width: parent.width - mySubIcon.width - parent.spacing
                            font {
                                family: "reMarkableSans-Regular"
                                pixelSize: parent.height*0.8
                            }
                            text: subContent.modelData
                            wrapMode: Text.WordWrap
                            verticalAlignment: Text.AlignVCenter
                            color: "#6A737B"
                        }
                    }
                }
            }
        }
    }
}
