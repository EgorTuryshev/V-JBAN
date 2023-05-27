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
    opacity: 1
    height: 10
    color: "blue"
    DropArea
    {
        id: dropArea
        anchors.fill: parent

        onEntered: (drag) => {
          fromIndex = drag.source.parent.index;
          toIndex = index;
          fromColumn = drag.source.parent.categoryId;
          toColumn = categoryId;
          // регистрация индекса
          categoriesModel.registerPos(fromColumn, fromIndex,toColumn, toIndex);
        }
    }
}
