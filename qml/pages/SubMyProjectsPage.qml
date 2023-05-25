import QtQuick 2.15
import QtQuick.Layouts 1.15

import '../controls'

Item
{
    id: root
    function onChatBtnClicked(id)
    {
        console.log(id)
    }

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
                onChatBtnClicked: function onChatBtnClicked() {
                    root.parent.currentIndex = 2;
                    root.parent.children[2].currLoaderIndex = 2; // TO-DO: это похоже на костыль
                }
                titleText: title
                descriptionText: description
                numOfDoneTickets: 5; // Заглушка
                numOfTickets: 10; // Заглушка
                height: description === "" ? 100 : 170
                width: parent.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
