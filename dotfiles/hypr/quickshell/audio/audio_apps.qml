import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.Pipewire
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import QtQuick.Controls
import Quickshell.Widgets

  PanelWindow {
    id:appVolumePopout
    aboveWindows: true
    exclusiveZone: 0
    
  property color main_color: "#09b18a"

  property color background_color: "#231f23"
  property color gray_color: "#404347"

  property color brighter_color: "#41f0c7"
  property color darker_color: "#0b6a55"
    

  anchors {
    top: true
  }

    width: 700
    height: 340
    color: "#00000000"



    Rectangle {
      id: bg_rect_app_audio
      anchors.fill: parent
      anchors.topMargin: 10
      color: background_color
      radius: 6
      border.width: 2
      border.color: darker_color

      ColumnLayout {
        //spacing: 10
        anchors.fill:parent
        anchors.margins: 10
        
          // Button groups for exclusive default selection
          ButtonGroup { id: appSinkGroup }

          // Section: Output (sink) devices
          Label { 
            text: "Application Audio:"
            font.bold: true
            font.pixelSize: 16
            color: darker_color
            anchors.top: parent.top
            anchors.left: parent.left
          }

          ScriptModel {
              id: appSinksModel
              values: Pipewire.nodes.values
                      .filter(n => n.isSink && n.isStream)
          }
          Repeater {
              model: appSinksModel
              delegate: RowLayout {
                  // Each delegate has a local reference to the PwNode
                  property var node: modelData
                  // Bind this node so audio.volume/muted are available
                  PwObjectTracker { objects: [node] }

                  // Device name label (fall back to node.name if description is empty)
                  Label {
                    id:source_label
                    color: main_color
                      text: (node.description !== "" ? node.description : node.name)
                      Layout.alignment: Qt.AlignVCenter
                  }

                  // Mute switch
                  Switch {
                    id:muteSwitch
                      checked: node.audio.muted
                      onCheckedChanged: node.audio.muted = checked
                      anchors.left: source_label

                      indicator: Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                          implicitWidth: 42
                          implicitHeight: 22
                          radius: height / 2

                          color: muteSwitch.checked ? "#ff5555" : gray_color

                          Rectangle {
                              anchors.verticalCenter: parent.verticalCenter
                              x: muteSwitch.checked ? parent.width - width - 2 : 2
                              width: 18
                              height: 18
                              radius: 9
                              color: main_color

                              Behavior on x {
                                  NumberAnimation { duration: 120 }
                              }
                          }
                      }
                  }

                  // Volume percentage label
                  Label {
                    text: `${Math.round(node.audio.volume * 100)}%`
                    color: brighter_color
                      Layout.preferredWidth: 40
                      Layout.alignment: Qt.AlignVCenter
                  }

                  // Volume slider (0.0–1.0)
                  Slider {
                    id: volumeSlider

                    value: node.audio.volume
                    from: 0; to: 1; stepSize: 0.01
                    Layout.fillWidth: true
                    Layout.rightMargin: 10
                    onValueChanged: node.audio.volume = value

                    background: Rectangle {
                      implicitHeight: 6
                      radius: 3
                      color: gray_color

                      Rectangle {
                        width: volumeSlider.visualPosition * parent.width
                        height: parent.height
                        color: darker_color
                        radius: 3
                      }
                    }

                    handle: Rectangle {
                      width: 14
                      height: 14
                      radius: 7
                      color: brighter_color
                      border.color: main_color
                      x: volumeSlider.visualPosition * parent.width

                      anchors.verticalCenter: parent.verticalCenter
                    }
                  }
              }
            }
          }
        }
      }



