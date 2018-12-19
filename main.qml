import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import Qt.labs.settings 1.0
ApplicationWindow{
	id:app
    visible:true
    title: 'Unikast from Unik Qml Engine by @nextsigner'
    width: Screen.width/2
    height: Screen.desktopAvailableHeight-altoBarra
    color: 'black'
    property string moduleName: 'unikast'
    property int altoBarra: 0
    property int fs: appSettings.fs

    property color c1: "#62DA06"
    property color c2: "#8DF73B"
    property color c3: "black"
    property color c4: "white"

    property int uHeight: 0
    Settings{
        id: appSettings
        category: 'conf-unikast'
        property int cantRun
        property bool fullScreen
        property bool logViewVisible

        property int fs

        property int lvh

        property real visibility
    }
    FontLoader {name: "FontAwesome";source: "qrc:/fontawesome-webfont.ttf";}


    UnikWebSocketServerView{id:uwss}

    LogView{
        id:logView
        width: parent.width
        height: appSettings.lvh
        fontSize: app.fs
        topHandlerHeight: Qt.platform.os!=='android'?app.fs*0.25:app.fs*0.75
        showUnikControls: true
        anchors.bottom: parent.bottom
        visible: appSettings.logViewVisible
    }
    Component.onCompleted: {
        var ukldata='-folder='+appsDir+'/unikast -cfg -wss'
        var ukl=appsDir+'/link_unikast.ukl'
        unik.setFile(ukl, ukldata)
        if(appSettings.lvh<=0){
            appSettings.lvh=100
        }
        if(appSettings.fs<=0){
            appSettings.fs=20
        }
        appSettings.logViewVisible=true

        if(Qt.platform.os==='windows'){
            var anchoBorde=(app.width-unik.frameWidth(app))/2
            var altoBarraTitulo=unik.frameHeight(app)-height
            app.altoBarra=height-(Screen.desktopAvailableHeight-altoBarraTitulo)
        }
    }
}
