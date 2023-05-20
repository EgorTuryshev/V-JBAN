import QtQuick 2.15
import QtQuick.Controls.Material 2.15

ControlTextButton
{
    id: root
    property bool isActive: false

    Material.foreground: isActive ? "#2563EB" : "#696969"
    indicator: Rectangle
    {
        anchors.top: parent.bottom
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: 3
        radius: 10
        color: "#2563EB"
        visible: parent.isActive
    }
}
