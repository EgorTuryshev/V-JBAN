import QtQuick 2.15
import MyApp

import '../controls'

Item
{
    anchors.fill: parent
    CategoriesModel
    {
        id: categoriesModel
        Component.onCompleted:
        {
            categoriesModel.populate();
        }
    }
    ListView
    {
        anchors.fill: parent
        orientation: ListView.Horizontal
        spacing: 20
        model: categoriesModel

        delegate: ModelControlCategory
        {
            tickets: model.tickets
            title: name
            categoryId: id
            width: 300
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 20
        }
    }
}
