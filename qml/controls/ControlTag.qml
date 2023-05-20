import QtQuick 2.15

Item
{
    id: root
    property alias text: tagText.text

    width: textMetrics.width + textMetrics.width / 2
    height: 25

    Rectangle
    {
        radius: 10
        color:"#3464CD"
        anchors.fill: parent
        Text
        {
            id: tagText
            anchors.fill: parent
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            text: "#NULL"
            font.pixelSize: 16
            font.family: "Roboto"
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
