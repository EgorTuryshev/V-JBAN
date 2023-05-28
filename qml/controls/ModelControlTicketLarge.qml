import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias header: header.text
    property alias projectName: projectName.text
    property alias description: desc.text

    height: columnLayout.implicitHeight + 2 * columnLayout.anchors.margins

    Rectangle
    {
        id: ticketRect
        color: "#F9F9F9"

        radius: 15
        anchors.fill: parent
        clip: true

        layer.enabled: true
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
            id: columnLayout
            anchors.fill: parent
            anchors.margins: 10
            clip: true

            RowLayout
            {
                Layout.fillWidth: true

                spacing: 10

                Text
                {
                    id: header
                    text: "Задача #1"
                    color: "#696969"
                    font.pixelSize: 20
                    font.italic: true
                    font.family: "Segoe UI"
                    elide: Qt.ElideRight

                    Layout.fillWidth: true
                    Layout.preferredWidth: 5
                }

                Text
                {
                    id: projectName
                    text: "Проект #1"
                    color: "#696969"
                    font.pixelSize: 16
                    font.bold: true
                    font.family: "Segoe UI"
                    elide: Text.ElideRight

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredWidth: 3
                    horizontalAlignment: Qt.AlignRight
                    verticalAlignment: Qt.AlignBottom
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

                RowLayout
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    ControlTag { fontSize: 14; text: "#high" }

                    ControlTag { fontSize: 14; text: "#large" }
                }


                ControlTimer
                {
                    Layout.fillHeight: true
                }
            }

            Text
            {
                id: desc

                text: qsTr("Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit. Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit.")
                color: "#696969"
                font.pixelSize: 16
                font.family: "Segoe UI"
                wrapMode: TextEdit.WordWrap
                elide: Text.ElideRight

                Layout.fillWidth: true
                Layout.preferredHeight: 70
            }
        }
    }
}
