import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts 1.15

ColumnLayout
{
    id: root

    property alias title: title.text
    property alias titleFontPixelSize: title.font.pixelSize
    property alias titleFontBold: title.font.bold

    property alias text: description.text
    property alias descriptionFontPixelSize: description.font.pixelSize
    property alias descriptionFontBold: description.font.bold

    Material.accent: '#2563EB'
    Material.foreground: '#71717A'

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
                onClicked: description.readOnly = false;
            }
        }
    }
    Rectangle
    {
        id: background
        color: "#F9F9F9"

        radius: 10
        Layout.fillWidth: true
        Layout.preferredHeight: 200
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

        TextArea
        {
            id: description

            anchors.fill: parent
            anchors.margins: 10
            anchors.topMargin: 25
            anchors.bottomMargin: 15

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
