import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias header: header.text

    width: 300
    height: 100
    Rectangle
    {
        id: ticketRect
        width: parent.width
        height: parent.height
        layer.enabled: true
        radius: 15
        clip: true
        color: "#EDEDED"
        layer.effect: DropShadow
        {
            color:"grey"
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 0
            verticalOffset: 0
        }
        /*MouseArea
        {
            id: mouseArea
            anchors.fill: parent
            drag.target: ticketRect

            drag.onActiveChanged:
            {
                if (mouseArea.drag.active)
                {
                }
                ticketRect.Drag.drop();
            }
        }*/
        ColumnLayout
        {
            anchors.fill: parent
            RowLayout
            {
                Layout.fillWidth: true
                Layout.preferredHeight: 30
                Layout.leftMargin: 10
                Text
                {
                    id: header
                    text: "Тест#1"
                    font.pixelSize: 24
                    font.family: "Segoe UI"
                    color:"#696969"
                    font.bold: true
                }
                ControlEditButton
                {
                    Layout.preferredWidth: 15
                    Layout.preferredHeight: 15
                }
                Item
                {
                    Layout.fillWidth: true
                }

                ControlMoreButton
                {
                    Layout.preferredWidth: 15
                    Layout.preferredHeight: 15
                    Layout.rightMargin: 10
                }
            }
            RowLayout
            {
                Layout.fillWidth: true
                Layout.preferredHeight: 20
                Layout.leftMargin: 10
                Layout.bottomMargin: 15
                ControlTag
                {
                    text: "#high"
                }
                ControlTag
                {
                    text: "#large"
                }

            }
            RowLayout
            {
                Layout.fillWidth: true
                Layout.preferredHeight: 35
                Layout.leftMargin: 10
                Layout.bottomMargin: 5
                Flickable
                {
                    Layout.fillHeight: true
                    Layout.preferredHeight: 20
                    RowLayout
                    {
                        ControlAvatar
                        {
                            width: 20
                        }
                        ControlAvatar
                        {
                            width: 20
                        }
                        ControlAvatar
                        {
                            width: 20
                        }
                    }
                }
                Item
                {
                    Layout.fillWidth: true
                }
                ControlTimer
                {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 50
                    Layout.rightMargin: 10
                }
            }
        }
    }
}
