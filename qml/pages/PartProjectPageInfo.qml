import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import '../controls'

Item
{
    anchors.fill: parent
    ColumnLayout
    {
        anchors.fill: parent
        ControlTextArea
        {
            text: qsTr("Проект #1")
            Layout.fillWidth: true
            fontPixelSize: 32
        }
        ControlDescriptionBox
        {
            title: qsTr("Описание:")
            text: qsTr("Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit.")
            descrHeight: 100
            Layout.fillWidth: true
            titleFontPixelSize: 24
            descriptionFontPixelSize: 16
        }
        RowLayout
        {
            Layout.fillWidth: true
            ColumnLayout
            {
                Layout.minimumWidth: 300
                spacing: 15
                ControlRegularText
                {
                    font.pixelSize: 24
                    text: "Участники:";
                    font.weight: Font.Bold
                }
                ControlPlusPanel
                {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 70
                    Layout.rightMargin: 5
                    Layout.leftMargin: 5
                    plusSize: 50
                    bgColor: "#F9F9F9"
                }
                ListView
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 15

                    model: ListModel
                    {
                        ListElement { mName: "Иванов Иван"; mRole: "Администратор"; isKickButtonVisible: false; isRoleCBVisible: false; }
                        ListElement { mName: "Сердюков Никита"; mRole: "Модератор"; isKickButtonVisible: true; isRoleCBVisible: true; }
                        ListElement { mName: "Валерьева Анастасия"; mRole: "Пользователь"; isKickButtonVisible: true; isRoleCBVisible: true; }
                        ListElement { mName: "Канева Александра"; mRole: "Пользователь"; isKickButtonVisible: true; isRoleCBVisible: true; }
                        ListElement { mName: "Маликов Евгений"; mRole: "Пользователь"; isKickButtonVisible: true; isRoleCBVisible: true; }
                        ListElement { mName: "Данилова Светлана"; mRole: "Пользователь"; isKickButtonVisible: true; isRoleCBVisible: true; }
                    }

                    delegate: ModelControlProjectMember {
                        memberName: mName
                        memberRole: mRole
                        isKickBtnEnabled: isKickButtonVisible
                        isRoleComboBoxVisible: isRoleCBVisible

                        width: parent.width - 10
                        height: 70
                        anchors.topMargin: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            ColumnLayout
            {
                Layout.minimumWidth: 300
                spacing: 15
                ControlRegularText
                {
                    font.pixelSize: 24
                    text: "Роли:";
                    font.weight: Font.Bold
                }
                ControlPlusPanel
                {
                    Layout.fillWidth: true
                    Layout.rightMargin: 5
                    Layout.leftMargin: 5
                    Layout.preferredHeight: 70
                    plusSize: 50
                    bgColor: "#F9F9F9"
                }
                ListView
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    spacing: 15

                    model: ListModel
                    {
                        ListElement { rName: "Администратор"; isDelBtnVisible: false; }
                        ListElement { rName: "Модератор"; isDelBtnVisible: false; }
                        ListElement { rName: "Пользователь"; isDelBtnVisible: false; }
                        ListElement { rName: "Billy"; isDelBtnVisible: true; }
                    }

                    delegate: ModelControlProjectRole {
                        roleName: rName
                        isDeleteBtnEnabled: isDelBtnVisible

                        width: parent.width - 10
                        height: 70
                        anchors.topMargin: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
}
