/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the My Aurora OS Application project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQml.Models 2.1
import QtQuick.XmlListModel 2.0


/*Page {
    ListModel {
        id: dataModel
        ListElement { text: "red";  textColor: "black" }
        ListElement { text: "light gray"; textColor: "blue" }
        ListElement { text: "black";  textColor: "white" }
        ListElement { text: "black"; textColor: "green" }
    }
    ListView {
       width: parent.width
       height: parent.height
       model: dataModel
       delegate: Rectangle {
           width: parent.width; height: 70;
           color: model.text
           Text {
               anchors.centerIn: parent
               text: model.text
               color: model.textColor
           }
        }
    }
}*/

/*Page {
    Button {
        id: addButton
        text: "Add item"
        anchors.bottom: parent.bottom
        width: parent.width
        height: 100
        color: "gray"
        onClicked: dataModel.append({ text: "Item # " + dataModel.i++})
    }
    ListModel {
        property int i: 1
        id: dataModel
    }
    ListView {
        width: parent.width
        height: parent.height - addButton.height
        model: dataModel
        delegate: Rectangle {
            width: parent.width; height: 70; color: "skyblue";
            MouseArea {
                anchors.fill: parent
                onClicked: dataModel.remove(model.index, 1)
            }
            Text {
                anchors.centerIn: parent
                text: model.text
            }
        }
    }
}*/

Page {
    XmlListModel {
        id: xmlListModel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "/ValCurs/Valute"
        XmlRole { name: "Name"; query: "Name/string()" }
        XmlRole { name: "Value"; query: "Value/string()" }
    }
    GridView {
        cellHeight: 75
        cellWidth: parent.width
        anchors.fill: parent
        model: xmlListModel
        delegate: Column {
            Text { text: Name }
            Text { text: Value }
        }
    }
}
