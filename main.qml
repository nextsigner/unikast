import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
ApplicationWindow{
	id:app
	visible:true
    title: 'Unikast from Unik Qml Engine by @nextsigner'
    width: Screen.width/2
    height: Screen.desktopAvailableHeight
    UnikWebSocketServerView{}

}
