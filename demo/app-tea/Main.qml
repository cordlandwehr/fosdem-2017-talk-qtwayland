// Copyright 2017  Andreas Cord-Landwehr <cordlandwehr@kde.org>
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
// IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
// THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQml 2.2

Rectangle {
    id: root
    width: 400
    height: 400
    color: "#1abc9c"

    property real seconds: 180

    signal sendNotification(string msg)

    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            if (root.seconds <= 0) {
                sendNotification("Tea is ready!");
                stop();
                return;
            }
            root.seconds -= 1
        }
    }

    Image {
        id: icon
        anchors {
            horizontalCenter: parent.horizontalCenter
            topMargin: 40
            top: parent.top
        }
        source: "cup.svg"
        width: 180
        height: 180
    }

    Row {
        id: controls
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: icon.bottom
            topMargin: 20
        }
        spacing: 40

        Button {
            id: minus
            text: "-"
            font.pointSize: 24
            onClicked: {
                root.seconds = Math.max(0, root.seconds - 15)
            }
        }

        Text {
            width: 60
            anchors.verticalCenter: parent.verticalCenter
            text: {
                var output;
                output = Math.floor(root.seconds / 60);
                output += ":";
                var seconds = (root.seconds % 60);
                if (seconds < 10) output = output + "0" + seconds;
                else output += seconds;
                return output;
            }
            font.pointSize: 24
        }

        Button {
            text: "+"
            font.pointSize: 24
            onClicked: {
                root.seconds += 15
            }
        }
    }

    Button {
        anchors {
            top: controls.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        text: "start"
        font.pointSize: 24
        onClicked: {
            timer.start()
        }
    }
}
