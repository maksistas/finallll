import QtQuick 2.12
import QtQuick.Controls 2.12


ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 600
    title: "Parken UI"
    property string msgQML: " "
    property bool msgBool: false



    // Главная страница
    Item{
        id: mainpage
        visible: true
        Text {
            id:ffg
            z:1
            text: background.color
            y:100
        }

        Rectangle {
            id: background
            color: "white"
            anchors.fill: parent



            ComboBox {
                id: combo
                model: ["Белый", "Синий", "Зеленый","Красный"]
                onCurrentTextChanged: {
                    switch (combo.currentIndex) {
                        case 0: background.color = "white"; break;
                        case 1: background.color = "blue"; break;
                        case 2: background.color = "green"; break;
                        case 3: background.color = "red"; break;
                    }
                }
            }


        }

        Button {
            id: portButton
            text: "Alg port"
            onClicked: stackView.push(portpage)
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.7
            width: 120
            height: 40


        }

        Button {
            id: devicesButton
            text: "devices info"
            onClicked: stackView.push(devicespage)
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.4
            width: 120
            height: 40


        }


        Button {
            text: "cpu info"
            onClicked: stackView.push(cpupage)
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.5
            width: 120
            height: 40


        }

        Button {
            text: "memory info"
            onClicked: stackView.push(memorypage)
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.6
            width: 120
            height: 40



        }
        Button {
            text: "dmesg"
            onClicked: stackView.push(dmesgpage)
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.3
            width: 120
            height: 40


        }
        Button {
            text: "Indicator"
            onClicked: stackView.push(indicator)
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.8
            width: 120
            height: 40


        }

    }
    // Страница с информацией о девайсах
    Item {
        id: devicespage
        visible: false
        Button {
            z:2
            text: "to main"
            onClicked: {
                stackView.pop()
            }
        }


            ScrollView {
                id: scrollView
                z:1
                anchors.fill: parent
                Text {
                    y: 40
                    id: devicestext
                    visible: true
                    text: page1Text

                }
            }

    }

    // Страница с информацией о проце
    Item {
        visible: false
        id: cpupage

            ScrollView {
                z:1
                id: scrollView1
                anchors.fill: parent
                Text {
                    y:40
                    id: cputext
                    visible: true
                    color: "black"
                    text: page2Text

                }
            }


        Button {
        z:2
text: "to main"
            onClicked: {
                stackView.pop()
            }
        }
    }

    // Страница с информацией о памяти
    Item {
        id: memorypage
        visible: false
        Button {
            z:2
            text: "to main"
            onClicked: {
                stackView.pop()
            }
        }


            ScrollView{
                id: scrollView2
                anchors.fill:parent
                z:1
                Text {
                    y: 40
                    width: 800
                    id: memorytext
                    visible: true
                    color: "black"
                    text: page3Text

                }

            }

    }


    Item {
        id: dmesgpage
        visible: false
        Button {
            z:2
            text: "to main"
            onClicked: {
                stackView.pop()
            }
        }


            ScrollView{
                id: scrollView3
                anchors.fill: parent
                z:1
                Text {
                    y: 40
                    id: dmesgtext
                    visible: true
                    color: "black"
                    text: page4Text


                }

            }

    }




    Item {
        id: portpage
        visible: false
        Button {
            z:2
            text: "to main"
            onClicked: {
                stackView.pop()
            }
        }


            ScrollView{
                id: scrollView5
                anchors.fill: parent
                z:1
                Text {
                    y: 40
                    id: porttext
                    visible: true
                    color: "black"
                    text: page5Text


                }

            }

    }






    Item {
        id: indicator


        Keys.onPressed: {
            if (event.key === Qt.Key_1) {
                console.log("Key 1");
                myobj.driver1Call();
            }
            if (event.key === Qt.Key_Up) {
                console.log("Up");
                msgQML = "Нажмите клавишу включения любого индикатора клавиатуры";
                msgBool = true; //msgBool говорит о том, что сообщение выведено и надо обработать нажатие NumLock или CapsLock
            }
            if(msgBool && (event.key === Qt.Key_NumLock)){ msgQML = "NumLock pressed" }
            if(msgBool && (event.key === Qt.Key_CapsLock)){ msgQML = "CapsLock pressed" }
            if (event.key > Qt.Key_F1 && event.key < Qt.Key_F12) { // адреса клавиш от F1 до F12
                console.log("F1-F12 pressed");
                myobj.driver3Call();
            }
        }

        Button {
            text: "back"
            onClicked:stackView.pop()
        }

        Column{
            anchors.centerIn: parent
            Text { text: "Нажмите кнопку 1, чтобы включить и выключить индикаторы" }
            Text { text: "Нажмите на стрелку вверх, чтобы узнать, какой индикатор будет включен"; }
            Text { text: "Нажмите на любую клавишу из F1-F12, чтобы инвертировать значения индикаторов";}

            Text{ text: " " } //
            Text{ text: " " } // для красоты
            Text{ text: " " }
            Text{ text: " " }

            Text{ text: msgQML } // этот текст меняется
        }
    }




    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainpage
    }


}
