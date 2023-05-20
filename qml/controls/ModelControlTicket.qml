import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias header: header.text

    width: 300
    height: 100
    MouseArea
    {
        id: mouseArea
        property bool held: false
        anchors.fill: parent
        drag.onActiveChanged:
        {
            if (mouseArea.drag.active)
            {
                ticketList.dragItemIndex = index // should absolete index of ticket
            }
        }
        drag.target: held ? ticketRect : undefined

        onPressAndHold: held = true
        onReleased: held = false
        DropArea
        {
            anchors
            {
                fill: parent
                margins: 10
            }

            onEntered: (drag) =>
            {
                visualModel.items.move(
                    drag.source.DelegateModel.itemsIndex,
                    mouseArea.DelegateModel.itemsIndex);
                    // move element between models based on ticket index
            }
        }
        Rectangle
        {
            id: ticketRect
            width: parent.width
            height: parent.height
            layer.enabled: true
            radius: 15
            clip: true
            color: mouseArea.held ? "lightsteelblue" : "#EDEDED"
            layer.effect: DropShadow
            {
                color:"grey"
                transparentBorder: true
                samples: 40
                radius: 10
                horizontalOffset: 0
                verticalOffset: 0
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
                    width: 280
                    height: 100
                }
                ParentChange
                {
                    target: ticketRect
                    parent: projectPage
                }
            }
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
                    id: thirdRow
                    Layout.fillWidth: true
                    Layout.preferredHeight: 35
                    Layout.leftMargin: 10
                    Layout.bottomMargin: 5
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
                            height: 10
                            width: thirdRow.width
                            visible: flickable.contentWidth > flickable.width
                            //position: flickable.position.x / (flickable.contentWidth - flickable.width)
                        }
                        RowLayout
                        {
                            id: rowLayout
                            height: 20
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
}

