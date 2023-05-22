import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias header: header.text
    property var fromIndex
    property var toIndex

    width: 300
    height: 115

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
        }

        DropArea
        {
            id: dropArea
            anchors.fill: parent

            onEntered: (drag) => {
                fromIndex = drag.source.DelegateModel.itemsIndex;
                toIndex = mouseArea.DelegateModel.itemsIndex;
                var fromColumn = drag.source.DelegateModel.groups[1];
                var toColumn = mouseArea.DelegateModel.groups[1];

                if (fromColumn !== toColumn) {
                   categoriesModel.moveTicket(categoriesModel.getCategoryIndexByName(fromColumn), fromIndex,
                                              categoriesModel.getCategoryIndexByName(toColumn), toIndex);
                } else {
                   visualModel.items.move(fromIndex, toIndex);
                   tickets.moveTicketInternally(fromIndex, toIndex);
                }
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
                anchors.margins: 10
                spacing: 10

                RowLayout
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30

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

                        Menu {
                            id: menu

                            MenuItem {
                                text: "Подробнее"
                                onTriggered: {
                                    // Действие при выборе "Подробнее"
                                    console.log("Подробнее selected")
                                }
                            }

                            MenuItem {
                                text: "Удалить"
                                onTriggered: {
                                    // Действие при выборе "Удалить"
                                    console.log("Удалить selected")
                                }
                            }
                        }

                        function onClicked() {
                            menu.open()
                        }
                    }
                }

                RowLayout
                {
                    Layout.fillWidth: true

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

                            ControlAvatar
                            {
                                size: 25
                            }
                            ControlAvatar
                            {
                                size: 25
                            }
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

