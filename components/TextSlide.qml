pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

Page {
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

        Item {
            id: titleContainer

            width: parent.width; height: root.isSmallScreen ? 24 : 80

            Text {
                id: titleText
                font {
                    family: "Helvetica"
                    pixelSize: parent.height
                    bold: true
                }
                color: "#2E2E2E"
            }
        }

        ListView {
            id: blocsList
            width: parent.width
            height: parent.height - titleContainer.height - parent.spacing
            model: root.contents
            spacing: root.isSmallScreen ? 10 : 20
            delegate: Column {
                id: blocDelegate

                required property var modelData
                required property int index

                property var subData: modelData.sub

                width: blocsList.width
                height: myText.implicitHeight + innerListView.height + spacing
                spacing: 20

                Text {
                    id: myText
                    width: parent.width
                    font {
                        family: "Helvetica"
                        pixelSize: root.isSmallScreen ? 24 : 48
                    }
                    wrapMode: Text.WordWrap
                    text: blocDelegate.modelData.main
                    color: "#6A737B"
                }

                ListView {
                    id: innerListView
                    width: parent.width - 40
                    anchors {
                        left: parent.left
                        leftMargin: 40
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

                        Item {
                            height: parent.height
                            width: height

                            Text {
                                anchors.fill: parent
                                text: "\u2666"
                                font {
                                    family: webFont.name
                                    pixelSize: parent.height*0.8
                                }
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                color: "#6A737B"
                            }
                        }

                        Text {
                            height: parent.height
                            font {
                                family: "Helvetica"
                                pixelSize: parent.height*0.8
                            }
                            text: subContent.modelData
                            verticalAlignment: Text.AlignVCenter
                            color: "#6A737B"
                        }
                    }
                }
            }
        }
    }
}
