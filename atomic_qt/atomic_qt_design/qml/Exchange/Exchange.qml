import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.12
import "../Components"
import "../Constants"
import "./Trade"
import "./Orders"
import "./History"

Item {
    id: exchange
    property int current_page: API.design_editor ? General.idx_exchange_trade : General.idx_exchange_trade

    function openTradeView(ticker) {
        exchange_trade.open(ticker)
    }

    function onTradeTickerChanged(ticker) {
        exchange_orders.changeTicker(ticker)
    }

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        anchors.fill: parent

        spacing: 20

        // Top tabs
        RowLayout {
            id: tabs
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.topMargin: 30
            spacing: 40

            ExchangeTab {
                dashboard_index: General.idx_exchange_trade
                text: "Trade"
            }

            ExchangeTab {
                dashboard_index: General.idx_exchange_orders
                text: "Orders"
                function onClick() {
                    exchange_orders.onOpened()
                }
            }

            ExchangeTab {
                dashboard_index: General.idx_exchange_history
                text: "History"
                function onClick() {
                    exchange_history.onOpened()
                }
            }
        }

        HorizontalLine {
            width: tabs.width * 1.25
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        // Bottom content
        StackLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.bottomMargin: 15
            Layout.leftMargin: Layout.bottomMargin
            Layout.rightMargin: Layout.bottomMargin

            currentIndex: current_page

            Trade {
                id: exchange_trade
            }

            Orders {
                id: exchange_orders
            }

            History {
                id: exchange_history
            }
        }
    }
}








/*##^##
Designer {
    D{i:0;autoSize:true;height:264;width:1200}
}
##^##*/
