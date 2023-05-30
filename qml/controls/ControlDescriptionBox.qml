import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts 1.15

ColumnLayout
{
    id: root

    property int descrHeight: 200

    property alias title: title.text
    property alias titleFontPixelSize: title.font.pixelSize
    property alias titleFontBold: title.font.bold

    property alias text: description.text
    property alias descriptionFontPixelSize: description.font.pixelSize
    property alias descriptionFontBold: description.font.bold

    Material.accent: '#2563EB'
    Material.foreground: '#696969'

    RowLayout
    {
        Layout.fillWidth: true

        Text
        {
            id: title
            text: "Nothing interesting here"
            font.pixelSize: 24
            font.bold: true
            color: Material.foreground
        }

        Image
        {
            source: "qrc:/edit.svg"

            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: description.readOnly = false
            }
        }
    }
    Rectangle
    {
        id: background
        color: "#F9F9F9"

        radius: 10
        Layout.fillWidth: true
        Layout.preferredHeight: root.descrHeight
        layer.enabled: true

        layer.effect: DropShadow
        {
            color: "grey"
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 0
            verticalOffset: 0
        }

        ScrollView
        {
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            TextArea
            {
                id: description
                anchors.fill: parent
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                Material.accent: '#D4D4D8'
                Material.foreground: '#696969'

                leftPadding: 0
                rightPadding: 0

                readOnly: true
                wrapMode: TextEdit.Wrap
                textFormat: TextEdit.RichText

                background: Item { }

                onEditingFinished:  readOnly = true;

                onReadOnlyChanged: {
                    if(readOnly === false)
                        forceActiveFocus();
                }
            }
        }
    }
}
