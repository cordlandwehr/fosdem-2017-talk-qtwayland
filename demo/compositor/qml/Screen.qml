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
import QtQuick.Window 2.2
import QtWayland.Compositor 1.0

WaylandOutput {
    id: output
    property alias surfaceList: listModel

    sizeFollowsWindow: true

    window: Window {
        id: screen
        width: 800
        height: 400
        visible: true

        WaylandMouseTracker {
            id: mouseTracker
            anchors.fill: parent
            windowSystemCursorEnabled: true
            Rectangle {
                anchors.fill: parent
                color: "darkgrey"
                ListView {
                    anchors.fill: parent
                    model: ListModel {
                        id: listModel
                    }
                    orientation: ListView.Horizontal
                    delegate: ShellSurfaceItem {
                        shellSurface: model.shellSurface
                        onSurfaceDestroyed: {
                            listModel.remove(index)
                        }
                    }
                }
            }

            WaylandCursorItem {
                inputEventsEnabled: false
                x: mouseTracker.mouseX - hotspotX
                y: mouseTracker.mouseY - hotspotY
                seat: output.compositor.defaultSeat
            }
        }
    }
}
