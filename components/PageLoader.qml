import QtQuick

Item {
    id: root

    // public properties
    property string source
    property QtObject currentItem: (_currentPage === 0) ? page0.item : page1.item
    // 0: no animation; 1: fade out ; 2: slide ; 3: curved slide
    property int animationType: 1
    // 0: left ; 1: right
    property bool reversedSlide: false
    property alias loading: pageSwap.running

    // private properties
    property int _currentPage: 0

    // signals
    signal pageLoaded()

    onSourceChanged: {
        if (source.length <= 0)
            return

        pageSwap.stop()
        if (_currentPage === 0) {
            page0.z = -1
            page1.z = 0
            pageSwapIn.target = page1
            pageSwapOut.target = page0
            if (animationType === 2)
                // no fading animation on opacity, set the value directly
                page1.opacity = 1
            _currentPage = 1
            page1.setSource(source)
        } else {
            page1.z = -1
            page0.z = 0
            pageSwapIn.target = page0
            pageSwapOut.target = page1
            if (animationType === 2)
                // no fading animation on opacity, set the value directly
                page0.opacity = 1
            _currentPage = 0
            page0.setSource(source)
        }
        pageSwap.start()
    }

    // note: Loader loads a component and provides it the current context
    Loader {
        id: page0

        width: root.width; height: root.height
        x: 0; y: 0
    }

    Loader {
        id: page1

        width: root.width; height: root.height
        x: 0; y: 0
    }

    ParallelAnimation {
        id: pageSwap

        onRunningChanged: {
            if (!running) {
                if (root._currentPage === 0)
                    page1.setSource("")
                else
                    page0.setSource("")
                root.pageLoaded()
            }
        }

        PropertyAnimation {
            id: pageSwapOut

            property: root.animationType === 2 ? "x" : "opacity"
            from: root.animationType === 2 ? 0 : 1
            to: {
                if (root.animationType === 2) {
                    if (!root.reversedSlide)
                        return -root.width
                    else
                        return root.width
                } else
                    return root.x
            }
            duration: root.animationType > 0 ? 250 : 10
            easing.type: root.animationType === 3 ? Easing.OutQuad : Easing.InQuad
        }

        PropertyAnimation {
            id: pageSwapIn

            property: root.animationType === 2 ? "x" : "opacity"
            from: {
                if (root.animationType === 2) {
                    if (!root.reversedSlide)
                        return root.width
                    else
                        return -root.width
                } else
                    return 0
            }
            to: root.animationType === 2 ? 0 : 1
            duration: root.animationType > 0 ? 250 : 10
            easing.type: Easing.InQuad
        }
    }
}
