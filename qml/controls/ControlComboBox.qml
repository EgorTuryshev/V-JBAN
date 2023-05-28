import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

ComboBox {
    id: root
    
    Material.accent: "#7a7a7a"
    Material.foreground: "#7a7a7a"
    Material.background: "#7a7a7a"

    delegate: ItemDelegate {
        width: root.width - 10

        property variant modelData: model

        contentItem: Text {
            text: modelData.name
            color: root.highlightedIndex === index ? "#7a7a7a" : "#9a9a9a"
            font.pixelSize: 12
            font.family: "Segoe UI"
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            width: parent.width
            height: parent.height
            color: "transparent"
            radius: 5

            Rectangle {
                color: "#334455"
                visible: root.highlightedIndex === index ? true : false

                width: 3
                height: 20
                radius: 5

                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    indicator: Image {
        id: indicatorIcon
        x: root.width - width - 10
        y: (root.availableHeight - height) / 2

        source: 'qrc:/down_arrow.svg'
        sourceSize: Qt.size(12, 12)

        Behavior on rotation {
            NumberAnimation { duration: 75 }
        }
    }

    contentItem: Item {
        anchors.fill: parent

        Text {
            anchors.fill: parent
            text: root.displayText

            color: "#7a7a7a"
            font.pixelSize: 14
            font.family: "Segoe UI"
            elide: Text.ElideRight

            leftPadding: 10
            verticalAlignment: Text.AlignVCenter
        }
    }

    background: Rectangle {
        id: rootBG
        color: "transparent"
        anchors.fill: parent
        border.color: "#D4D4D8"
        border.width: 2
        radius: 8
    }

    popup: Popup {
        y: root.height - 1
        width: root.width
        implicitHeight: contentItem.implicitHeight + 10
        padding: 5

        contentItem: ListView {
            implicitHeight: contentHeight
            model: root.popup.visible ? root.delegateModel : null
            clip: true
            currentIndex: root.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            color: "#e4e4e4"
            radius: 5
            clip: true

            layer.enabled: root.hovered | root.down
            layer.effect: DropShadow {
                color: "#e3e3e3"
                opacity: 0.3
                transparentBorder: true
                samples: 40
                radius: 10
                horizontalOffset: 4
                verticalOffset: 4
            }
        }

        onVisibleChanged: visible ? indicatorIcon.rotation = 180 : indicatorIcon.rotation = 0
    }
}
