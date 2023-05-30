import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias memberName: mName.text
    property alias memberRole: mRole.text
    property bool isRoleComboBoxVisible: true
    property bool isKickBtnEnabled: true

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
            Image
            {
                source: "qrc:/avatar.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 50
                sourceSize.height: 50
                smooth: true
                Layout.rightMargin: 10
                Layout.maximumWidth: 50
            }
            ColumnLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 5
                ControlRegularText {
                    id: mName
                    text: "Иванов Иван"
                    font.weight: Font.DemiBold
                    elide: Text.ElideRight
                    Layout.alignment: Qt.AlignLeft
                    Layout.preferredWidth: 5
                    Layout.fillWidth: true
                }
                RowLayout {
//                    Layout.alignment: Qt.AlignLeft
                    Layout.preferredWidth: 5
                    Layout.fillWidth: true
                    ControlRegularText {
                        id: mRole
                        text: "Пользователь"
                        Layout.alignment: Qt.AlignLeft
                    }
                    Image
                    {
                        id: arrow
                        source: "qrc:/down_arrow.svg"
                        sourceSize.width: 10
                        sourceSize.height: 10
                        smooth: true

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: isRoleComboBoxVisible ? Qt.PointingHandCursor : Qt.ArrowCursor
                        }
                    }
                    ColorOverlay
                    {
                        anchors.fill: arrow
                        source: arrow
                        color: isRoleComboBoxVisible ? "#3464CD" : "#BDC7DE"
                    }
                }
            }
            ControlRegularErrorText {
                text: "Исключить"
                font.weight: Font.Bold
                color: isKickBtnEnabled ? "#D72E2E" : "#E7CACA"
                MouseArea {
                    anchors.fill: parent
                    cursorShape: isKickBtnEnabled ? Qt.PointingHandCursor : Qt.ArrowCursor
                }
            }
        }
    }
}
