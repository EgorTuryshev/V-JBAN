import QtQuick 2.15

Item
{
    implicitWidth: time.width

    function getTimeLeft(deadLine) {
        //return ((deadLine - new Date()).toLocaleTimeString(Qt.locale("de_DE"))).slice(0, 8);
    }

    Timer
    {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            //time.text = getTimeLeft(Date.fromLocaleString(Qt.locale("de_DE"), "30.06.2023", "dd.MM.yyyy"))
            time.text = (new Date().toLocaleTimeString(Qt.locale("de_DE"))).slice(0, 8)
        }
    }

    Text
    {
        id: time
//        text: "00:00:00"
        color:"#A45454"
        font.family: "Segoe UI"
        font.pixelSize: 14
        font.bold: true

        anchors.fill: parent
        verticalAlignment: Qt.AlignVCenter
    }
}
