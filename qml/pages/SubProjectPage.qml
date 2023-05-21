import QtQuick 2.15

import '../controls'

Item
{
    id: projectPage
    anchors.fill: parent
    clip: true
    ListView
    {
        anchors.fill: parent
        orientation: ListView.Horizontal
        spacing: 20
        model: categories
        /*{
            ListElement { name: "Category 1" }
            ListElement { name: "Category 2" }
            ListElement { name: "Category 3" }
            ListElement { name: "Category 4" }
            ListElement { name: "Category 5" }
        }*/

        delegate: ModelControlCategory
        {
            title: name
            width: 300
            height: parent.height
            anchors.top: parent.top
            anchors.topMargin: 20
        }
    }
}
