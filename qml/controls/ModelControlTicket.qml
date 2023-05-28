import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias header: header.text

    property int index
    property int categoryId

    width: 500
    height: columnLayout.implicitHeight + 2 * columnLayout.anchors.margins

    MouseArea
    {
        id: mouseArea
        property bool held: false
        anchors.fill: parent

        drag.target: held ? ticketRect : undefined

        onPressAndHold: held = true

        onReleased:
        {
            held = false;
            //отправка по последнему общему индексу
            categoriesModel.moveTicketToLastRegisteredPos();
        }

        Rectangle
        {
            id: ticketRect
            color: mouseArea.held ? "lightsteelblue" : "#EDEDED"

            radius: 15
            width: parent.width
            height: parent.height
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

            Behavior on color { ColorAnimation { duration: 100 } }

            Drag.active: mouseArea.held
            Drag.source: mouseArea
            Drag.hotSpot.x: width / 2
            Drag.hotSpot.y: height / 2

            states: State
            {
                when: mouseArea.held

                PropertyChanges
                {
                    target: ticketRect
                    width: root.width
                    height: root.height
                }
                ParentChange
                {
                    target: ticketRect
                    parent: projectPage
                }
            }

            ColumnLayout
            {
                id:  columnLayout
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                RowLayout
                {
                    Layout.fillWidth: true

                    Text
                    {
                        id: header
                        text: "Тест #1"
                        font.pixelSize: 20
                        font.family: "Segoe UI"
                        color:"#696969"
                        font.bold: true
                    }

                    ControlEditButton
                    {
                        Layout.preferredWidth: 15
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

                    ControlTag { fontSize: 14; text: "#high" }

                    ControlTag { fontSize: 14; text: "#large" }
                }

                RowLayout
                {
                    id: thirdRow
                    Layout.fillWidth: true

                    Flickable
                    {
                        id: flickable
                        Layout.fillWidth: true
                        Layout.preferredHeight: 30
                        contentWidth: rowLayout.width
                        contentHeight: rowLayout.height
                        interactive: true
                        flickableDirection: Flickable.HorizontalFlick
                        clip: true

                        ScrollBar.horizontal: ScrollBar
                        {
                            policy: ScrollBar.AlwaysOn
                            size: flickable.width
                            height: 8
                            width: thirdRow.width
                            visible: flickable.contentWidth > flickable.width
                        }

                        RowLayout
                        {
                            id: rowLayout

                            ControlAvatar { size: 25 }
                            ControlAvatar { size: 25 }
                        }
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
}

