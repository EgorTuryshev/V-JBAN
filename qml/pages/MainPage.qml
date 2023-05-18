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
            ControlMenuButton
            {
                id: projectMenuButton
                isActive: true
                text: "Проекты"
                height: menuBar.height

                onClicked:
                {
                    router.currentIndex = 0
                    isActive = true
                    myTicketsMenuButton.isActive = false
                    currProjectMenuButton.isActive = false
                }
            }
            ControlMenuButton
            {
                id: myTicketsMenuButton
                isActive: projectMenuButton.isActive || currProjectMenuButton.isActive ? false : true
                text: "Мои задачи"
                height: menuBar.height

                onClicked:
                {
                    router.currentIndex = 1
                    isActive = true
                    projectMenuButton.isActive = false
                    currProjectMenuButton.isActive = false
                }
            }
            ControlMenuButton
            {
                id: currProjectMenuButton
                isActive: projectMenuButton.isActive || myTicketsMenuButton.isActive ? false : true
                text: "Текущий проект"
                height: menuBar.height

                onClicked:
                {
                    router.currentIndex = 2
                    isActive = true
                    projectMenuButton.isActive = false
                    myTicketsMenuButton.isActive = false
                }
            }
        }
    }
    StackLayout
    {
        id: router
        anchors.leftMargin: parent.width * 0.1
        anchors.rightMargin: parent.width * 0.1
        anchors.topMargin: 35
        anchors.bottomMargin: 35
        anchors.top: menuBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        currentIndex: 0
        SubMyProjectsPage
        {

        }
        SubTicketsPage
        {

        }
        SubProjectPage
        {

        }
    }
}
