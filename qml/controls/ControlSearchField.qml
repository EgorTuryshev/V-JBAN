import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    id: root
    height: 20

    property alias phText: textField.placeholderText

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

            background: Item
            {
                implicitHeight: parent.height
                implicitWidth: parent.width
                visible: false
            }
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: searchIcon.right
            anchors.rightMargin: 25
            font.pixelSize: 16
            topPadding: 5
            bottomPadding: 5
            color: "#71717A"
            placeholderText: qsTr("")
            Material.accent: '#D4D4D8'
            Material.foreground: '#71717A'
        }

        Image
        {
            id: searchIcon
            anchors.right: parent.right
            width: 15
            height: width
            source: "qrc:/res/search.svg"
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}

