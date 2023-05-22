import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import MyApp

import '../controls'

Item
{
    id: root
    anchors.fill: parent
    CategoriesModel
    {
        id: categoriesModel
        Component.onCompleted:
        {
            categoriesModel.populate();
        }
    }
    RowLayout
    {
        id: rowLayout
        anchors.fill: parent
        spacing: 20
        ListView
        {
            id: listView
            Layout.fillHeight: true
            Layout.fillWidth: true
            orientation: ListView.Horizontal
            spacing: 20
            model: categoriesModel

            delegate: ModelControlCategory
            {
                tickets: model.tickets
                title: name
                categoryId: id
                width: 400
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.topMargin: 20
            }
        }
        ControlPlusPanel
        {
            id: addCategoryButton
            Layout.fillHeight: true
            Layout.preferredWidth: 100
            Layout.topMargin: 20
            Layout.alignment: Qt.AlignTop
            plusSize: 20
            bgColor: "#F9F9F9"
            visible: listView.contentX + listView.width >= listView.contentWidth - 10
        }
    }
}
