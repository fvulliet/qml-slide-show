import QtQuick
import QtQuick.Layouts
import ThemesModule
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Screen and DPI* considerations"
    pageNb: 12
    code:
    `Rectangle {
        id: container
        Themes.style_brightColor
        Rectangle {
            id: green
            width: Screen.width/5
            height: Screen.height/5
        }
        Rectangle {
            id: lightgreen
            width: container.width/5
            height: container.height/5
        }
    }`
    dynamicComp: Rectangle {
        id: container
        color: Themes.style_brightColor

        Rectangle {
            id: greenRect
            color: Themes.style_themeColor
            width: Screen.width/5
            height: Screen.height/5
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                anchors.fill: parent

                Row {
                    width: parent.width
                    height: parent.height/3

                    Item {
                        height: parent.height
                        width: parent.width/3
                    }
                    Text {
                        height: parent.height
                        width: parent.width/3
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.viewport === 0 ? 16 : 32
                            bold: true
                        }
                        color: Themes.style_darkestColor
                        text: "W"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Text {
                        height: parent.height
                        width: parent.width/3
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.viewport === 0 ? 16 : 32
                            bold: true
                        }
                        color: Themes.style_darkestColor
                        text: "H"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Row {
                    width: parent.width
                    height: parent.height/3

                    Text {
                        height: parent.height
                        width: parent.width/3
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.viewport === 0 ? 16 : 32
                            bold: true
                        }
                        color: Themes.style_darkestColor
                        text: "Screen"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                    }
                    Text {
                        height: parent.height
                        width: parent.width/3
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.viewport === 0 ? 16 : 32
                        }
                        color: Themes.style_darkestColor
                        text: Math.round(Screen.width)
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Text {
                        height: parent.height
                        width: parent.width/3
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.viewport === 0 ? 16 : 32
                        }
                        text: Math.round(Screen.height)
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Row {
                    width: parent.width
                    height: parent.height/3

                    Text {
                        height: parent.height
                        width: parent.width/3
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.viewport === 0 ? 16 : 32
                            bold: true
                        }
                        color: Themes.style_darkestColor
                        text: "green"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight
                    }
                    Text {
                        height: parent.height
                        width: parent.width/3
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.viewport === 0 ? 16 : 32
                        }
                        color: Themes.style_darkestColor
                        text: Math.round(greenRect.width)
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Text {
                        height: parent.height
                        width: parent.width/3
                        font {
                            family: "reMarkableSans-Regular"
                            pixelSize: root.viewport === 0 ? 16 : 32
                        }
                        color: Themes.style_darkestColor
                        text: Math.round(greenRect.height)
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

        Rectangle {
            color: "lightgreen"
            width: parent.width/5
            height: parent.height/5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            Text {
                anchors.fill: parent
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: root.viewport === 0 ? 16 : 32
                }
                text: "gray/5"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
