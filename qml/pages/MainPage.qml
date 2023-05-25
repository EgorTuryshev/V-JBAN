import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

import '../controls'

Item
{
    id: root
    anchors.fill: parent
    Rectangle
    {
        id: menuBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 50
        layer.enabled: true
        layer.effect: DropShadow
        {
            color:"grey"
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 0
            verticalOffset: 0
        }
        RowLayout
        {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 20
            anchors.leftMargin: parent.width * 0.1 + 5
            anchors.rightMargin: parent.width * 0.1 + 5
            spacing: 30

            ButtonGroup {
                id: topMenuBtnGroup
                exclusive: true
            }

            Repeater {
                id: menuItems

                Component.onCompleted: menuItems.itemAt(0).checked = true

                model: ListModel {
                    ListElement { name: 'Проекты' }
                    ListElement { name: 'Мои задачи' }
                    ListElement { name: 'Текущий проект' }
                }

                delegate: ControlMenuButton {
                    text: name
                    ButtonGroup.group: topMenuBtnGroup

                    onClicked: router.currentIndex = index
                }
            }
        }
    }
    StackLayout
    {
        id: router
        currentIndex: 0

        anchors.top: menuBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.leftMargin: parent.width * 0.1
        anchors.rightMargin: parent.width * 0.1
        anchors.topMargin: 35
        anchors.bottomMargin: 35

        SubMyProjectsPage { Layout.fillWidth: true; Layout.fillHeight: true; }

        SubTicketsPage { Layout.fillWidth: true; Layout.fillHeight: true; }

        SubProjectPage { Layout.fillWidth: true; Layout.fillHeight: true; }
    }
}
