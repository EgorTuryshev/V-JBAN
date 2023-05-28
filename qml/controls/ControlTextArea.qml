import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

RowLayout
{
    id: root
    property alias text: textArea.text
    property alias fontPixelSize: textArea.font.pixelSize
    property alias fontBold: textArea.font.bold

    TextArea
    {
        id: textArea
        Layout.preferredWidth: textMetrics.width + 32
        readOnly: true
        text: "Nothing interesting here"
        font.pixelSize: 24
        font.bold: true
        Material.accent: '#2563EB'
        Material.foreground: '#71717A'
        wrapMode: TextEdit.NoWrap

        background: Item
        {
            width: textMetrics.width + 32
            implicitHeight: textMetrics.height + textArea.font.pixelSize
        }

        onEditingFinished:
        {
            readOnly = true;
        }

        onReadOnlyChanged:
        {
            if(readOnly === false)
            {
                selectAll();
                forceActiveFocus();
            }
        }

        onLineCountChanged:
        {
            text = text.replace(/[\r\n]+/gm, "");
            readOnly = true;
            deselect();
        }
    }

    Image
    {
        source: "qrc:/edit.svg"
        MouseArea
        {
            anchors.fill: parent
            onClicked: textArea.readOnly = false;
        }
    }

    TextMetrics
    {
        id: textMetrics
        text: textArea.text
        font.family: textArea.font.family
        font.bold: textArea.font.bold
        font.pixelSize: textArea.font.pixelSize
    }
}
