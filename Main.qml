import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

// Window {
//     width: 640
//     height: 480
//     visible: true
//     title: qsTr("AVIM TextArea Example")

//     ColumnLayout {
//         anchors.fill: parent
//         anchors.margins: 10

//         VietTextArea {
//             Layout.fillWidth: true
//             Layout.fillHeight: true
//             placeholderText: qsTr("Type here with Vietnamese input...")
//         }
//     }
// }

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("AVIM Text Area Example")

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        VietTextInput {
            Layout.fillWidth: true
            Layout.fillHeight: true
            placeholderText: qsTr("Type here with Vietnamese input...")
        }

        VietTextInput {
            Layout.fillWidth: true
            Layout.fillHeight: true
            vietnameseInput: false
            placeholderText: qsTr("Normal input (Vietnamese input disabled)")
        }
    }
}
