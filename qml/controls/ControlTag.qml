import QtQuick 2.15

Item
{
    id: root
    property alias text: tagText.text

    width: textMetrics.width + textMetrics.width / 2
    height: 20

    Rectangle
    {
        radius: 15
        color:"#3464CD"
        anchors.fill: parent

        Text
        {
            id: tagText
            anchors.fill: parent
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            text: "#NULL"
            font.pixelSize: 14
            font.family: "Segoe UI"
            color: "white"
            font.bold: true
        }

        TextMetrics
        {
            id: textMetrics
            font.pixelSize: tagText.font.pixelSize
            font.family: tagText.font.family
            text: tagText.text
        }
    }
}
