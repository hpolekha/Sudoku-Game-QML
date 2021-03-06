import QtQuick 2.12
import QtQuick.Window 2.12

Rectangle {
    id: field
    property int cellsPerRow: 9
    property int cellsPerCol: cellsPerRow
    property int cellWidth: 50
    property int cellBorderWidth : 1
    property variant puzzle: [
        0,1,5, 6,0,7, 0,3,4,
        0,2,7, 0,0,0, 0,5,0,
        6,8,0, 0,0,4, 7,1,0,

        5,0,0, 1,0,0, 4,0,0,
        0,3,0, 0,7,0, 0,0,5,
        0,0,4, 0,0,8, 9,2,0,

        3,0,9, 7,0,6, 1,0,5,
        0,0,6, 8,9,1, 3,0,0,
        0,7,0, 3,0,5, 0,0,0
    ]
    property variant solution: [
        9,1,5, 6,8,7, 2,3,4,
        4,2,7, 9,1,3, 8,5,6,
        6,8,3, 2,5,4, 7,1,9,

        5,9,8, 1,6,2, 4,7,3,
        1,3,2, 4,7,9, 5,6,8,
        7,6,4, 5,3,8, 9,2,1,

        3,4,9, 7,2,6, 1,8,5,
        2,5,6, 8,9,1, 3,4,7,
        8,7,1, 3,4,5, 6,9,2
    ]

    width: cellWidth * cellsPerRow
    height: cellWidth * cellsPerCol

    Column {

        Repeater {
            model: cellsPerRow

            Row {
                property int rowIndex: index
                Repeater {
                    model: cellsPerCol
                    Cell {
                        property int columnIndex: index
                        id: cell
                        width: field.cellWidth
                        border.width: field.cellBorderWidth
                        x: 0
                        y: 0
                        value: puzzle[rowIndex * 9 + columnIndex]
                        editable: (puzzle[rowIndex * 9 + columnIndex] == 0 ? true : false)

                    }
                }
            }
        }

    }

    Rectangle {
        x:parent.cellWidth * 3
        height: parent.height
        width: parent.cellBorderWidth * 5

    }
    Rectangle {
        x: parent.cellWidth * 6
        width: parent.cellBorderWidth * 5
        height: parent.height
    }
    Rectangle {
        y: parent.cellWidth * 3
        width: parent.width
        height: parent.cellBorderWidth * 5
    }
    Rectangle {
        y: parent.cellWidth * 6
        width: parent.width
        height: parent.cellBorderWidth * 5
    }

    function check(){

        var k = 0;
        for(var i = 0; i < 9; i++){
            for(var j = 0; j < 9; j++){
                if(puzzle[i*9+j] == solution[i*9+j]){
                    k++;
                }
            }
        }
        if(k == 81){
            //console.log("Winner");
            label.text = "Winner";
            label.color = "white";
            label.font.bold = true;
            window.color = "purple";
        }else{
            //console.log("Try Again :(");
            label.text = "Try Again :(";

        }
    }

}


