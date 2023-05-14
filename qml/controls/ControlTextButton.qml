import QtQuick 2.15
import QtQuick.Controls.Material 2.15

ControlButton
{
    id: root
    width: textMetrics.width + textMetrics.width / 5
    Material.background: "transparent"
    Material.accent: "transparent"
    Material.foreground: "#2563EB"
    background: Item
    topInset: 0
    bottomInset: 0
    verticalPadding: 0
    leftPadding: 0
    rightPadding: 0
    spacing: 0
    TextMetrics
    {
        id: textMetrics
        font.pixelSize: root.font.pixelSize
        font.family: root.font.family
        text: root.text
    }
}
