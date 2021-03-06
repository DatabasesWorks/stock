
/*!
	\file

	\author Igor Mironchik (igor.mironchik at gmail dot com).

	Copyright (c) 2018 Igor Mironchik

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ScrollView {
    id: screen
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
    ScrollBar.vertical.policy: ScrollBar.AsNeeded

    //! 0 - by product search, 1 - by place.
    property int type: 0

    ColumnLayout {
        width: appWindow.width

        Repeater {
            model: searchModel

            delegate: Item {
                Layout.fillWidth: true
                implicitHeight: row.implicitHeight + 1

                Rectangle {
                    color: "#C7C8C9FF"
                    anchors.bottom: parent.bottom
                    height: 1
                    width: parent.width - 5
                    x: 5
                }

                Row {
                    id: row
                    anchors.fill: parent
                    spacing: 20
                    width: parent.width

                    Column {
                        id: col
                        spacing: 5

                        Text {
                            text: type === 0 ? qsTr( "<b>Place: </b>" ) + model[ "PlaceRole" ] :
                                qsTr( "<b>Code: </b>" ) + model[ "CodeRole" ]
                        }

                        Text {
                            text: qsTr( "<b>Amount: </b>" ) + model[ "AmountRole" ]
                        }
                    }

                    Text {
                        text: model[ "DescRole" ]
                        width: parent.width - col.width - 20
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }
    }
}
