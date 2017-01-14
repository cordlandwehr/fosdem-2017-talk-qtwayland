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

Rectangle {
    id: root
    width: 400
    height: 400
    color: "#fdbc4b"

    property real seconds: 180

    signal sendNotification(string msg)

    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            if (root.seconds <= 0) {
                sendNotification("Egg is ready!");
                stop();
                return;
            }
            root.seconds -= 1
        }
    }

    Column {
        anchors {
            top: parent.top
            topMargin: 80
            left: parent.left
            leftMargin: 30
        }

        spacing: 40
        Button {
            text: "5 min"
            font.pointSize: 24
            onClicked: {
                root.seconds = 60 * 5
                timer.start()
            }
        }
        Button {
            text: "7 min"
            font.pointSize: 24
            onClicked: {
                root.seconds = 60 * 7
                timer.start()
            }
        }
        Button {
            text: "9 min"
            font.pointSize: 24
            onClicked: {
                root.seconds = 60 * 9
                timer.start()
            }
        }
    }

    Image {
        anchors {
            right: parent.right
            rightMargin: 40
            verticalCenter: parent.verticalCenter
        }

        width: 150
        height: 150
        source: "egg.svg"

        Text {
            anchors.centerIn: parent
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
    }
}
