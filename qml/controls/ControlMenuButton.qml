import QtQuick 2.15
import QtQuick.Controls.Material 2.15

ControlTextButton
{
    id: root

    checkable: true

    Material.accent: "#2563EB"
    Material.foreground: checked ? "#2563EB" : "#696969"

    indicator: Rectangle
    {
        anchors.top: parent.bottom
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: 3
        radius: 10
        color: "#2563EB"
        visible: parent.checked
    }

    MouseArea {
        anchors.fill: parent
        enabled: false
        cursorShape: Qt.PointingHandCursor
    }
}
