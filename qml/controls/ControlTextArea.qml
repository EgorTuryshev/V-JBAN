import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

RowLayout
{
    id: root
    property alias text: textArea.text
    property alias fontPixelSize: textArea.font.pixelSize
    property alias fontBold: textArea.font.bold
    property alias fontWeight: textArea.font.weight
    property int editBtnSize: 24
    property int textToBtnDist: 10

    TextArea
    {
        id: textArea
        Layout.preferredWidth: textMetrics.width + textToBtnDist
        readOnly: true
        text: "Nothing interesting here"
        font.pixelSize: 24
        font.bold: true
        Material.accent: '#D4D4D8'
        Material.foreground: '#696969'
        wrapMode: TextEdit.NoWrap
        leftPadding: 0;
        rightPadding: 0;

        background: Item
        {
            width: textMetrics.width + textToBtnDist
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
        Layout.preferredWidth: editBtnSize
        Layout.preferredHeight: editBtnSize
        source: "qrc:/edit.svg"
        MouseArea
        {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
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
        font.weight:textArea.font.weight
    }
}
