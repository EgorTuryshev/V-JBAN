import QtQuick 2.15
import QtQuick.Controls.Material 2.15

ControlTextButton
{
    id: root

    checkable: true

    Material.accent: "#2563EB"
    Material.foreground: "#2563EB"

    text: "  Чат"
    font.bold: true

    indicator: Item
    {}

    icon.source: "qrc:/chat.svg"
    icon.height: 15
    icon.width: 15

    MouseArea {
        anchors.fill: parent
        enabled: false
        cursorShape: Qt.PointingHandCursor
    }
}
