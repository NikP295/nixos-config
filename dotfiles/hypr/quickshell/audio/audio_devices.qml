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
    id:volumePopout
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
      id: bg_rect_audio
      anchors.fill: parent
      anchors.topMargin: 10
      color: background_color
      radius: 6
      border.width: 2
      border.color: darker_color

      ColumnLayout {
        spacing: 10
        anchors.fill:parent
        anchors.margins: 10
        
          // Button groups for exclusive default selection
          ButtonGroup { id: sinkGroup }
          ButtonGroup { id: sourceGroup }

          // Section: Output (sink) devices
          // Section: Output (sink) devices
          Label { text: "Output Devices:"; font.bold: true; color: darker_color }
          ScriptModel {
              id: sinksModel
              // Filter for audio-capable hardware sinks (isSink == true)
              values: Pipewire.nodes.values
                       .filter(n => !n.isStream && n.audio && n.isSink)
          }
          Repeater {
              model: sinksModel
              delegate: RowLayout {
                  // Each delegate has a local reference to the PwNode
                  property var node: modelData
                  // Bind this node so audio.volume/muted are available
                  PwObjectTracker { objects: [node] }

                  // RadioButton to select default sink
                  RadioButton {
                      id: rb
                      //color: checked ? main_color : gray_color
                      checked: (Pipewire.defaultAudioSink === node)
                      onClicked: Pipewire.preferredDefaultAudioSink = node

                      indicator: Rectangle {
                        anchors.centerIn: parent
                        implicitWidth: 16
                        implicitHeight: 16
                        width:16
                        height:16
                        radius: 13
                        border.width: 29
                        //border.color: checked ? "#ffffff" : "#ffffff"
                        border.color: gray_color
                        //color: main_color

                        Rectangle {
                          anchors.centerIn: parent
                          width: 8
                          height: 8
                          radius: 7
                          border.width: 6
                          //border.color:  control.checked ? "#17a81a" : "#21be2b"
                          border.color: main_color
                          visible: rb.checked
                      } 
                    }
                  }

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

          // Section: Input (source) devices
          // Section: Input (source) devices
          Label { text: "Input Devices:"; font.bold: true; color: darker_color }
          ScriptModel {
              id: sourcesModel
              // Filter for audio-capable hardware sources (isSink == false)
              values: Pipewire.nodes.values
                       .filter(n => !n.isStream && n.audio && !n.isSink)
          }
          Repeater {
              model: sourcesModel
              delegate: RowLayout {
                  property var node: modelData
                  PwObjectTracker { objects: [node] }

                  RadioButton {
                    id: rb
                      checked: (Pipewire.defaultAudioSource === node)
                      onClicked: Pipewire.preferredDefaultAudioSource = node

                      indicator: Rectangle {
                        anchors.centerIn: parent
                        implicitWidth: 16
                        implicitHeight: 16
                        width:16
                        height:16
                        radius: 13
                        border.width: 29
                        //border.color: checked ? "#ffffff" : "#ffffff"
                        border.color: gray_color
                        //color: main_color

                        Rectangle {
                          anchors.centerIn: parent
                          width: 8
                          height: 8
                          radius: 7
                          border.width: 6
                          //border.color:  control.checked ? "#17a81a" : "#21be2b"
                          border.color: main_color
                          visible: rb.checked
                      } 
                    }
                  }

                  Label {
                    color:main_color
                      text: (node.description !== "" ? node.description : node.name)
                      Layout.alignment: Qt.AlignVCenter
                  }
                  Switch {
                    checked: node.audio.muted
                    onCheckedChanged: node.audio.muted = checked
                    id:muteSwitch
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
                  Label {
                    text: `${Math.round(node.audio.volume * 100)}%`
                    color: brighter_color
                      Layout.preferredWidth: 40
                      Layout.alignment: Qt.AlignVCenter
                  }
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
