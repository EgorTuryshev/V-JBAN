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
            anchors.leftMargin: 10
            Repeater
            {
                model: 3
                ControlMenuButton
                {
                    enabled: true
                    text:"some_text"
                    height: menuBar.height
                }
            }
        }
    }
    StackLayout
    {
        anchors.top: menuBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        SubProjectPage
        {

        }
    }
}
