import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import MyApp

import '../controls'

Item
{
    id: root
    anchors.fill: parent

    RowLayout
    {
        id: rowLayout
        anchors.fill: parent
        spacing: 20
        ScrollView
        {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width - 50

            ListView
            {
                id: listView
                anchors.fill: parent
                anchors.bottomMargin: 30
                orientation: ListView.Horizontal
                spacing: 20

                model: CategoriesModel {
                    id: categoriesModel
                    Component.onCompleted: categoriesModel.populate();
                }

                delegate: ModelControlCategory {
                    tickets: model.tickets
                    title: name
                    categoryId: id
                    width: 400
                    height: parent.height
                    anchors.topMargin: 20
                }
            }
        }
        ControlPlusPanel
        {
            id: addCategoryButton
            height: 50
            width: 50
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft;
            plusSize: 25
            bgColor: "#F9F9F9"
            visible: listView.contentX + listView.width >= listView.contentWidth - 10
        }
    }
}
