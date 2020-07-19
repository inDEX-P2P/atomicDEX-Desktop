import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "../Constants"

Rectangle {
    visible: API.get().update_status.update_needed

    color: Style.colorGreen
    height: 30 + radius
    width: text.width + 30 + radius

    anchors.topMargin: -radius
    anchors.rightMargin: -radius

    radius: Style.rectangleCornerRadius

    DefaultText {
        id: text
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -parent.radius * 0.5
        anchors.verticalCenterOffset: parent.radius * 0.4

        text: API.get().empty_string + (General.download_icon + " " + qsTr("New update available!") + " " + qsTr("Version:") + " " + API.get().update_status.new_version + "  -  " + qsTr("Click here for the details."))
        font.pixelSize: Style.textSizeSmall3
        color: Style.colorWhite10
    }

    MouseArea {
        anchors.fill: parent
        onClicked: update_modal.open()
    }
}