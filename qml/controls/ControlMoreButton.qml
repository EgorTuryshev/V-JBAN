import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    id: root
    function onClicked() {
        menu.open();
    }

    Menu {
        id: menu

        MenuItem {
            text: "Подробнее"
            icon.source: "qrc:/simple_edit.svg"
            Material.foreground: "#3464CD"
            font.pixelSize: 14
            font.weight: Font.Bold
            height: 45
            padding: 5
        }

        MenuItem {
            text: "Удалить"
            icon.source: "qrc:/delete.svg"
            Material.foreground: "#D72E2E"
            font.pixelSize: 14
            font.weight: Font.Bold
            height: 45
            padding: 5
        }

        width: 150

        topPadding: 0
        bottomPadding: 0

        delegate: MenuItem {
            id: menuItem

            padding: 5
            spacing: 5

            contentItem: IconLabel {
                icon: menuItem.icon
//                text: menuItem.text
                color: "#9a9a9a"
                font.pixelSize: 12
                font.family: "Segoe UI"
            }

            background: Rectangle {
                opacity: enabled ? 1 : 0.3
                color: menuItem.highlighted ? "#21be2b" : "transparent"
            }
        }

        background: Rectangle {
            clip: true
            color: "#e4e4e4"
            radius: 8
        }
    }

    Image
    {
        id: image
        source: "qrc:/more.svg"
        anchors.fill: parent

        MouseArea
        {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: root.onClicked();
        }
    }
}

