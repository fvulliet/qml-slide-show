pragma ComponentBehavior: Bound
import QtQuick
import ThemesModule

Slide {
    id: root

    property string imageSrc
    property bool animate: true
    property string text
    property double _ratio: 1
    property int speed: 250
    property bool rotate: true
    property real imageRatio: 0.8

    SequentialAnimation {
        running: root.animate
        loops: Animation.Infinite
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "_ratio"
                from: 0.5; to: 1
                easing.type: Easing.OutQuad; duration: 2*root.speed
            }
            NumberAnimation {
                target: img
                property: "opacity"
                from: 0; to: 1
                easing.type: Easing.OutQuad; duration: 2*root.speed
            }
        }
        NumberAnimation {
            target: root
            property: "_ratio"
            from: 1; to: 0.9
            easing.type: Easing.InQuad; duration: root.speed
        }
        NumberAnimation {
            target: root
            property: "_ratio"
            from: 0.9; to: 1
            easing.type: Easing.InQuad; duration: root.speed
        }
        NumberAnimation {
            target: root
            property: "_ratio"
            from: 1; to: 0.9
            easing.type: Easing.InQuad; duration: root.speed
        }
        NumberAnimation {
            target: root
            property: "_ratio"
            from: 0.9; to: 1
            easing.type: Easing.InQuad; duration: root.speed
        }
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "_ratio"
                from: 1; to: 0.5
                easing.type: Easing.InQuad; duration: 6*root.speed
            }
            NumberAnimation {
                target: img
                property: "opacity"
                from: 1; to: 0
                easing.type: Easing.InQuad; duration: 6*root.speed
            }
            NumberAnimation {
                target: img
                property: "rotation"
                from: 0; to: root.rotate ? 360 : 0
                easing.type: Easing.InQuad; duration: 6*root.speed
            }
        }
    }

    Text {
        anchors {
            top: parent.top
            topMargin: 20
            left: parent.left
            leftMargin: 20
        }
        font {
            family: "reMarkableSans-Regular"
            pixelSize: root.viewport === 0 ? 48 : 96
            bold: true
            italic: true
        }
        color: Themes.style_darkestColor
        text: root.text
        visible: text.length > 0 && opacity > 0
        opacity: root._ratio >= 0.9 ? 1 : 0
        Behavior on opacity { NumberAnimation {duration:250} }
    }

    Image {
        id: img

        height: root.height * root.imageRatio * root._ratio
        width: root.width * root.imageRatio * root._ratio
        source: root.imageSrc
        fillMode: Image.PreserveAspectFit
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
    }
}
