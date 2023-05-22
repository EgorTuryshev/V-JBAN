import QtQuick 2.15
import QtQuick.Layouts 1.15

import '../controls'

Item
{
    id: root

    ColumnLayout
    {
        anchors.fill: parent
        spacing: 30

        ControlSearchField
        {
            Layout.margins: 5
            Layout.preferredHeight: 35
            Layout.fillWidth: true
            onChanged: function filter() { projectSortModel.nameFilter = mainText; }
        }

        ListView
        {
            clip: true
            spacing: 30
            Layout.fillWidth: true
            Layout.fillHeight: true

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
}
