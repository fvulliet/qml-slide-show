pragma ComponentBehavior: Bound
import QtQuick

Slide {
    id: root

    property string imageSrc
    property bool animate: true
    property double _ratio: 1

    SequentialAnimation {
        running: root.animate
        loops: Animation.Infinite
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "_ratio"
                from: 0.5; to: 1
                easing.type: Easing.OutQuad; duration: 500
            }
            NumberAnimation {
                target: img
                property: "opacity"
                from: 0; to: 1
                easing.type: Easing.OutQuad; duration: 500
            }
        }
        NumberAnimation {
            target: root
            property: "_ratio"
            from: 1; to: 0.9
            easing.type: Easing.InQuad; duration: 250
        }
        NumberAnimation {
            target: root
            property: "_ratio"
            from: 0.9; to: 1
            easing.type: Easing.InQuad; duration: 250
        }
        NumberAnimation {
            target: root
            property: "_ratio"
            from: 1; to: 0.9
            easing.type: Easing.InQuad; duration: 250
        }
        NumberAnimation {
            target: root
            property: "_ratio"
            from: 0.9; to: 1
            easing.type: Easing.InQuad; duration: 250
        }
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "_ratio"
                from: 1; to: 0.5
                easing.type: Easing.InQuad; duration: 1500
            }
            NumberAnimation {
                target: img
                property: "opacity"
                from: 1; to: 0
                easing.type: Easing.InQuad; duration: 1500
            }
            NumberAnimation {
                target: img
                property: "rotation"
                from: 0; to: 360
                easing.type: Easing.InQuad; duration: 1500
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
            pixelSize: root.isSmallScreen ? 48 : 96
            bold: true
            italic: true
        }
        color: "#2E2E2E"
        text: "\"Am I a responsive dude ?\""
        visible: opacity > 0
        opacity: root._ratio >= 0.9 ? 1 : 0
        Behavior on opacity { NumberAnimation {duration:250} }
    }

    Image {
        id: img

        height: root.height * 0.8 * root._ratio
        width: root.width * 0.8 * root._ratio
        source: root.imageSrc
        fillMode: Image.PreserveAspectFit
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
    }
}
