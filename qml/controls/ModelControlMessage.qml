import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property string userName: "Иванов Иван"
    property string time: "00:00"
    property string msgText: "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque nibh nibh, at maximus ante."
    property bool isUserMsg: false

    height: columnLayout.implicitHeight + 2 * columnLayout.anchors.margins

    Rectangle
    {
        id: ticketRect
        color: isUserMsg? "#E8F2FF" : "#F9F9F9"

        radius: 15
        anchors.fill: parent
        layer.enabled: true
        clip: true

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
                id: messageText
                text: root.msgText
                wrapMode: TextEdit.WordWrap

                Layout.fillWidth: true
            }
        }
    }
}
