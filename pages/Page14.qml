import QtQuick
import QtQuick.Layouts
import ThemesModule
import "../components" as Components

Components.CodeSlide {
    id: root

    title: "UI-logic"
    pageNb: 14
    code:
    `Rectangle {
        id: gray

        Rectangle {
            color: "green"
            height: Math.max(gray.height/2, 200) // mini 200
            width: gray.width/2 > 300 ? 300 : gray.width/2 // maxi 300
        }
    }`
    dynamicComp: Rectangle {
        id: container
        color: Themes.style_brightColor

        Rectangle {
            color: Themes.style_themeColor
            height: Math.max(container.height/2, 200) // mini 200
            width: container.width/2 > 300 ? 300 : container.width/2 // maxi 300

            Column {
                anchors.fill: parent
                visible: root.viewport !== 0
                Text {
                    width: parent.width
                    height: parent.height/2
                    font {
                        family: "reMarkableSans-Regular"
                        pixelSize: 24
                        bold: true
                    }
                    color: Themes.style_darkestColor
                    text: "min. height=200"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                Text {
                    width: parent.width
                    height: parent.height/2
                    font {
                        family: "reMarkableSans-Regular"
                        pixelSize: 24
                        bold: true
                    }
                    color: Themes.style_darkestColor
                    text: "max.width=300"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
