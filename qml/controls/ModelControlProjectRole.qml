import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias roleName: rName.text
    property bool isDeleteBtnEnabled: true

//    height: rowLayout.implicitHeight + 2 * rowLayout.anchors.margins

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

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            anchors.margins: 10

            ControlTextArea {
                id: rName
                text: "Пользователь"
                fontBold: false
                fontWeight: Font.DemiBold
                fontPixelSize: 16
                Layout.fillWidth: true
                Layout.preferredWidth: 5

                editBtnSize: 15
                textToBtnDist: 0
            }

            Item {
                Layout.fillWidth: true
            }

            ControlRegularText {
                text: "Права"
                font.weight: Font.Bold
                color: "#2563EB"
                Layout.rightMargin: 20

                elide: Text.ElideRight
//                Layout.fillWidth: true
//                Layout.preferredWidth: 5
                horizontalAlignment: Qt.AlignRight

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }
            }

            ControlRegularErrorText {
                text: "Удалить"
                font.weight: Font.Bold

                elide: Text.ElideRight

                color: isDeleteBtnEnabled ? "#D72E2E" : "#E7CACA"
                MouseArea {
                    anchors.fill: parent
                    cursorShape: isDeleteBtnEnabled ? Qt.PointingHandCursor : Qt.ArrowCursor
                }
            }
        }
    }
}
