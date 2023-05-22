import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import MyApp

import '../controls'

Item
{
    id: projectPage
    anchors.fill: parent

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
               }

               delegate: ControlMenuButton
               {
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
            Layout.fillWidth: true
            Layout.fillHeight: true
            sourceComponent: PartProjectPageTasks { }
            onCurrentIndexChanged:
            {
                currentIndex === 0 ? setSource("PartProjectPageTasks.qml") : setSource("PartProjectPageInfo.qml");
            }
        }
    }
}
