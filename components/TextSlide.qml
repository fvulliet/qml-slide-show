pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

Page {
    id: root

    property alias title: titleText.text
    property var contents: []

    FontLoader {
        id: webFont
        source: "qrc:/fonts/fa-solid-900.ttf"
    }

    Column {
        anchors {
            fill: parent
            margins: 16
        }
        spacing: isSmallScreen ? 24 : 48

        Item {
            id: titleContainer

            width: parent.width; height: titleText.implicitHeight

            Text {
                id: titleText
                font {
                    family: "Helvetica"
                    pixelSize: isSmallScreen ? 40 : 80
                    bold: true
                }
            }
        }

        Item {
            id: bodyContainer

            width: parent.width; height: parent.height - titleContainer.height - parent.spacing

            ListView {
                id: blocsList
                anchors.fill: parent
                model: root.contents
                delegate: ColumnLayout {
                    required property var modelData

                    width: blocsList.width
                    spacing: 16

                    Text {
                        Layout.fillWidth: true
                        font {
                            family: "Helvetica"
                            pixelSize: isSmallScreen ? 24 : 48
                        }
                        wrapMode: Text.WordWrap
                        text: parent.modelData.main
                    }

                    ListView {
                        Layout.fillWidth: true
                        model: parent.modelData.sub
                        delegate: Row {
                            id: row
                            required property string modelData

                            height: isSmallScreen ? 24 : 48
                            spacing: 10

                            Item {
                                height: parent.height
                                width: height

                                Text {
                                    anchors.fill: parent
                                    text: "\uf043"
                                    font {
                                        family: webFont.name
                                        pixelSize: isSmallScreen ? 18 : 36
                                    }
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }

                            Text {
                                height: parent.height
                                font {
                                    family: "Helvetica"
                                    pixelSize: isSmallScreen ? 18 : 36
                                }
                                text: row.modelData
                            }
                        }
                    }
                }
            }
        }
    }

}
