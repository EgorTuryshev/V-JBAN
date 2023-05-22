import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    id: root
    clip: true

    property alias phText: textField.placeholderText
    property alias mainText: textField.text
    property var onChanged

    Rectangle
    {
        id: borderRect
        anchors.fill: parent
        border.color: "#D4D4D8"
        border.width: 2
        radius: 8
        color: "#FFFFFF"

        TextField
        {
            id: textField

            topPadding: 5
            bottomPadding: 5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: searchIcon.right
            anchors.rightMargin: 25

            color: "#71717A"
            font.pixelSize: 16
            placeholderText: qsTr("")
            Material.accent: '#D4D4D8'
            Material.foreground: '#71717A'

            onTextChanged: onChanged();

            background: Item
            {
                visible: false
            }
        }

        Image
        {
            id: searchIcon
            anchors.right: parent.right
            width: 15
            height: width
            source: "qrc:/res/search.png"
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}

