import QtQuick 2.15
import QtQuick.Layouts 1.15

import '../controls'

Item
{
    id: root
    anchors.fill: parent

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
        model: ListModel
        {
            ListElement { name: "Проект #1"; doneTickets: 3; totalTickets: 17; }
            ListElement { name: "Проект #2"; doneTickets: 5; totalTickets: 100; }
            ListElement { name: "Проект #3"; doneTickets: 0; totalTickets: 100; }
            ListElement { name: "Проект #4"; doneTickets: 99; totalTickets: 100; }
            ListElement { name: "Проект #5"; doneTickets: 100; totalTickets: 100; desc: "Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit. Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit." }
            ListElement { name: "Разработка плагинов для Windows 11"; doneTickets: 5; totalTickets: 10; desc: "Необходимо разработать приложение на Qt под Windows 11, которое объединит в себе множество плагинов для повышения качества пользовательского опыта." }
        }

        delegate: ModelControlProject
        {
            header: name
            description: desc !== "" ? desc : ""
            numOfDoneTickets: doneTickets;
            numOfTickets: totalTickets;
            height: desc === "" ? 100 : 170
            width: parent.width - 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
