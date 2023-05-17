import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias header: header.text
    property alias projectName: projectName.text

    Rectangle
    {
        id: ticketRect
        width: parent.width
        height: parent.height
        layer.enabled: true
        radius: 15
        clip: true
        color: "#F9F9F9"
        layer.effect: DropShadow
        {
            color: "#e3e3e3"
            opacity: 0.3
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 4
            verticalOffset: 4
        }
        ColumnLayout
        {
            anchors.fill: parent
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            RowLayout
            {
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true
                Text
                {
                    id: header
                    text: "Задача #1"
                    font.pixelSize: 20
                    font.family: "Segoe UI"
                    color: "#696969"
                    font.bold: true
                    Layout.maximumWidth: 300
                    elide: Qt.ElideRight
                }
                ControlTimer
                {
                    Layout.leftMargin: 15
                    Layout.fillHeight: true
                }
                Item
                {
                    Layout.fillWidth: true
                    Layout.minimumWidth: 100
                }
                Text
                {
                    id: projectName
                    text: "Проект #1"
                    font.pixelSize: 16
                    font.family: "Segoe UI"
                    color: "#696969"
                    font.bold: true
                    Layout.rightMargin: 15
                    Layout.maximumWidth: 300
                    elide: Text.ElideRight
                }
                ControlMoreButton
                {
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                }
            }
            RowLayout
            {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                ControlTag
                {
                    text: "#high"
                }
                ControlTag
                {
                    text: "#large"
                }

            }
            Text
            {
                Layout.alignment: Qt.AlignTop
                id: desc
                text: qsTr("Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit. Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit.")
                font.pixelSize: 16
                font.family: "Segoe UI"
                color: "#696969"
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                wrapMode: TextEdit.WordWrap
                elide: Text.ElideRight
            }
        }
    }
}
