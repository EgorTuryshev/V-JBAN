import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property string userName: "Иванов Иван"
    property string time: "00:00"
    property string msgText: "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque nibh nibh, at maximus ante."

    Rectangle
    {
        id: ticketRect
        width: parent.width
        height: colLay.height
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
            id: colLay
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 10
            height: messageText.height + top.height
            spacing: 0

            RowLayout
            {
                id: top
                Layout.fillWidth: true
                ControlAvatar
                {
                    size: 25
                }
                ControlRegularText
                {
                    text: root.userName
                    font.weight: Font.DemiBold
                }
                ControlRegularText
                {
                    text: root.time
                }
            }
            ControlRegularText
            {
                Layout.fillWidth: true
                id: messageText
                text: root.msgText
                wrapMode: TextEdit.WordWrap
                elide: Text.ElideRight
            }
        }
    }
}
