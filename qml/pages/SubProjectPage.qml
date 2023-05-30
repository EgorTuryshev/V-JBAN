import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import MyApp

import '../controls'

Item
{
    id: projectPage
    property alias currLoaderIndex: router.currentIndex

    ColumnLayout
    {
        anchors.fill: parent
        RowLayout
        {
            Layout.fillWidth: true
            spacing: 30

            ButtonGroup
            {
                id: subMenuBtnGroup
                exclusive: true
            }

            Repeater
            {
                id: menuItems

                Component.onCompleted: menuItems.itemAt(0).checked = true

                model: ListModel
                {
                    ListElement { name: 'Задачи' }
                    ListElement { name: 'Информация о проекте' }
                    ListElement { name: 'Чат проекта' }
                }

                delegate: ControlMenuButton
                {
                    id: controlMenu

                    text: name
                    font.pixelSize: 24
                    font.bold: true

                    ButtonGroup.group: subMenuBtnGroup
                    onClicked: router.currentIndex = index;
                }
            }
        }

        Loader
        {
            id: router
            property int currentIndex: 0
            sourceComponent: PartProjectPageTasks { }

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.topMargin: 50;
//            clip: true

            onCurrentIndexChanged:
            {
                if (currentIndex == 0)
                {
                    setSource("PartProjectPageTasks.qml");
                    menuItems.itemAt(0).checked = true;
                }
                else if (currentIndex == 1)
                {
                    setSource("PartProjectPageInfo.qml");
                    menuItems.itemAt(1).checked = true;
                }
                else
                {
                    setSource("PartProjectPageChat.qml");
                    menuItems.itemAt(2).checked = true;
                }
            }
        }
    }
}
