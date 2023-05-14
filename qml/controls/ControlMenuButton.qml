import QtQuick 2.15
import QtQuick.Controls.Material 2.15

ControlTextButton
{
    Material.foreground: enabled ? "#2563EB" : "#696969"
    indicator: Rectangle
    {
        anchors.top: parent.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: 3
        radius: 10
        color: "#2563EB"
        visible: parent.enabled
    }
}
