import QtQuick
import ThemesModule
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "Declarative syntax & bindings"
    pageNb: 4
    code:
    `Rectangle {
        color: "gray"

        Rectangle {
            color: "green"
            width: container.width/4
            height: container.height/2
        }
    }`
    dynamicComp: Rectangle {
        id: container
        color: Themes.style_brightColor

        Text {
            anchors {
                bottom: parent.top
                horizontalCenter: parent.horizontalCenter
            }
            font {
                family: "reMarkableSans-Regular"
                pixelSize: 40
                bold: true
            }
            color: Themes.style_darkestColor
            text: Math.round(container.width)
            verticalAlignment: Text.AlignBottom
        }

        Text {
            anchors {
                right: parent.left
                verticalCenter: parent.verticalCenter
            }
            font {
                family: "reMarkableSans-Regular"
                pixelSize: 40
                bold: true
            }
            color: Themes.style_darkestColor
            text: Math.round(container.height)
            horizontalAlignment: Text.AlignRight
        }

        Rectangle {
            id: containee
            color: Themes.style_themeColor
            width: parent.width/4
            height: parent.height/2

            Text {
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: 40
                    bold: true
                }
                color: Themes.style_darkestColor
                text: Math.round(containee.width)
                verticalAlignment: Text.AlignBottom
            }

            Text {
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                font {
                    family: "reMarkableSans-Regular"
                    pixelSize: 40
                    bold: true
                }
                color: Themes.style_darkestColor
                text: Math.round(containee.height)
                rotation: 0
            }
        }
    }
}
