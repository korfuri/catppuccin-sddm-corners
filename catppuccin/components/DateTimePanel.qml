import QtQuick 2.15
import QtQuick.Controls 2.15

Column {
    spacing: config.DateTimeSpacing

    Component.onCompleted: {
        timeLabel.updateTime();
        dateLabel.updateDate();
    }

    Text {
        id: dateLabel

        anchors.horizontalCenter: parent.horizontalCenter
        opacity: config.DateOpacity

        renderType: Text.NativeRendering
        font.family: config.FontFamily
        font.pointSize: config.DateSize
        font.bold: config.DateIsBold == "true" ? true : false
        color: config.DateColor

        function updateDate() {
            text = new Date().toLocaleDateString(Qt.locale(), config.DateFormat);
        }

        font {
            family: config.FontFamily
            pointSize: config.DateSize
            bold: config.DateIsBold === "true"
        }

        anchors { right: parent.right }
    }

    Text {
        id: timeLabel

        anchors.horizontalCenter: parent.horizontalCenter
        opacity: config.TimeOpacity

        renderType: Text.NativeRendering
        font.family: config.FontFamily
        font.pointSize: config.TimeSize
        font.bold: config.TimeIsBold == "true" ? true : false
        color: config.TimeColor

        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(), config.TimeFormat);
        }

        font {
            family: config.FontFamily
            pointSize: config.TimeSize
            bold: config.TimeIsBold === "true"
        }

        anchors { right: parent.right }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: {
            timeLabel.updateTime();
            dateLabel.updateDate();
        }
    }
}
