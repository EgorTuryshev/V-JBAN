import QtQuick 2.15
import '../controls'

Item {
    ListView
    {
        anchors.fill: parent
        clip: true
        spacing: 10

        model: ListModel
        {
            ListElement { usrName: "Иванов Иван"; msgTime: "00:00"; text: "Всем привет! Как продвигается работа?"; isUsrMsg: true }
            ListElement { usrName: "Сердюков Никита"; msgTime: "00:05"; text: "Плохо, батенька! Ничего не успеваю :("; isUsrMsg: false }
            ListElement { usrName: "Иванов Иван"; msgTime: "00:06"; text: "Я вот тоже... Приходится ночами работать"; isUsrMsg: true }
            ListElement { usrName: "Валерьева Анастасия"; msgTime: "00:08"; text: "Это что, я вот уже три дня не сплю..."; isUsrMsg: false }
            ListElement { usrName: "Иванов Иван"; msgTime: "00:10"; text: "Правильно, Настя, работайте — вы три месяца на рабочем месте в \"Косынку\" играли!"; isUsrMsg: true }
            ListElement { usrName: "Валерьева Анастасия"; msgTime: "00:12"; text: "..."; isUsrMsg: false }
            ListElement { usrName: "Сердюков Никита"; msgTime: "00:15"; text: "Ха-ха-ха! Эко вы ее, Иван Иванович!"; isUsrMsg: false }
            ListElement { usrName: "Marcus Tullius"; msgTime: "00:30"; text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."; isUsrMsg: false }
        }

        delegate: ModelControlMessage
        {
            userName: usrName;
            time: msgTime;
            msgText: text;
            isUserMsg: isUsrMsg;
            width: parent.width - 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
