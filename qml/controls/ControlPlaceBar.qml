import QtQuick 2.15

Rectangle
{
    id: root
    property var fromIndex
    property var toIndex
    property var fromColumn
    property var toColumn

    property int index
    property int categoryId

    radius: 10
    height: 4
    color: "#2563eb"

    opacity: 0

    Behavior on opacity { NumberAnimation { duration: 200 } }

    DropArea
    {
        id: dropArea
        anchors.fill: parent

        onEntered: (drag) => {
            fromIndex = drag.source.parent.index;
            toIndex = index;
            fromColumn = drag.source.parent.categoryId;
            toColumn = categoryId;

            // Делаем видимой цель перетаскивания
            root.opacity = 1;

            console.log("<--------------- DRAG EVENT START --------------->");
            console.log("FromColumn: ", fromIndex, " -> FromIndex: ", fromIndex);
            console.log("ToColumn:   ", toColumn, " -> ToIndex:   ", toIndex);

            // Регистрация индекса
            categoriesModel.registerPos(fromColumn, fromIndex,toColumn, toIndex);
        }

        onExited: () => {
            root.opacity = 0;
        }
    }
}
