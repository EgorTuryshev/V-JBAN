import QtQuick 2.15
import QtQuick.Layouts 1.15

import '../controls'

Item
{
    id: root

    RowLayout
    {
        id: topControls
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 5

        ControlSearchField
        {
            Layout.leftMargin: 5
            Layout.preferredHeight: 30
            Layout.preferredWidth: parent.width - 5
            onChanged: function filter() { projectSortModel.nameFilter = mainText; }
        }
    }

    ListView
    {
        clip: true
        anchors.top: topControls.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.topMargin: 35
        spacing: 30

        model: projectSortModel
        delegate: ModelControlProject
        {
            titleText: model.title
            descriptionText: model.description
            numOfDoneTickets: 5; // Заглушка
            numOfTickets: 10; // Заглушка
            height: model.description === "" ? 100 : 170
            width: parent.width - 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
