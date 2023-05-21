import QtQuick 2.15
import MyApp

import '../controls'

Item
{
    id: projectPage
    anchors.fill: parent
    clip: true
    CategoriesModel
    {
        id: categoriesModel
        Component.onCompleted:
        {
            categoriesModel.populate();
            //console.log("Model count: " + categoriesModel.rowCount());
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
            width: 300
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 20
        }
    }
}
