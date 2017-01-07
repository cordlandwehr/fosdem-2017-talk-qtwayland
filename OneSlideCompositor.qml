import QtQuick 2.0
import QtQuick.Window 2.2
import QtWayland.Compositor 1.0
import Fosdemdemo2017 1.0

WaylandCompositor {
    id: demoCompositor
    WaylandOutput {
        compositor: demoCompositor
        sizeFollowsWindow: true
        window: Window {
            width: 800; height: 400; visible: true
            Rectangle {
                anchors.fill: parent
                ListView {
                    anchors.fill: parent
                    model: ListModel { id: listModel }
                    orientation: ListView.Horizontal
                    delegate: ShellSurfaceItem {
                        shellSurface: model.shellSurface
                        onSurfaceDestroyed: { listModel.remove(index) }
                    }
                }
            }
        }
    }
    WlShell {
        onWlShellSurfaceCreated: {
            listModel.append({"shellSurface": shellSurface});
} } }

