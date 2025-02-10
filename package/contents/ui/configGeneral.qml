/*
    SPDX-FileCopyrightText: 2025 Vladimir Kosolapov
    SPDX-License-Identifier: GPL-3.0-or-later
*/

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kcmutils
import org.kde.kirigami as Kirigami

SimpleKCM {
    id: generalPage

    property alias cfg_useSymbolicIcon: useSymbolicIcon.checked
    property alias cfg_showSearchField: showSearchField.checked
    property alias cfg_showToolbarPanel: showToolbarPanel.checked
    property alias cfg_showOnlyTitles: showOnlyTitles.checked
    property alias cfg_maxSnippets: maxSnippetsSpinner.value
    property alias cfg_useKbdNavigation: useKbdNavigation.checked

    readonly property bool isPanel: plasmoid.formFactor === 2 || plasmoid.formFactor === 3

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true

        Kirigami.FormLayout {
            wideMode: true

            Item { implicitHeight: Kirigami.Units.largeSpacing }

            ColumnLayout {
                Kirigami.FormData.isSection: true

                Kirigami.Heading {
                    text: i18n("Appearance")
                    level: 2
                    Layout.leftMargin: Kirigami.Units.largeSpacing
                }

                Label {
                    text: i18n("Configure how the widget looks")
                    font: Kirigami.Theme.smallFont
                    opacity: 0.7
                    Layout.leftMargin: Kirigami.Units.largeSpacing
                }
            }

            Item { implicitHeight: Kirigami.Units.smallSpacing }

            ColumnLayout {
                Layout.leftMargin: Kirigami.Units.largeSpacing

                CheckBox {
                    id: useSymbolicIcon
                    text: i18n("Monochrome icon")
                    visible: isPanel
                    enabled: visible
                }

                Label {
                    text: i18n("Use a monochrome icon that matches the color scheme")
                    font: Kirigami.Theme.smallFont
                    opacity: 0.7
                    leftPadding: useSymbolicIcon.indicator.width + useSymbolicIcon.spacing
                    visible: isPanel
                }
            }

            ColumnLayout {
                Layout.leftMargin: Kirigami.Units.largeSpacing

                CheckBox {
                    id: showSearchField
                    text: i18n("Enable search bar")
                }

                Label {
                    text: i18n("Show a search field at the top of the widget")
                    font: Kirigami.Theme.smallFont
                    opacity: 0.7
                    leftPadding: showSearchField.indicator.width + showSearchField.spacing
                }
            }

            ColumnLayout {
                Layout.leftMargin: Kirigami.Units.largeSpacing

                CheckBox {
                    id: showToolbarPanel
                    text: i18n("Show bottom toolbar")
                }

                Label {
                    text: i18n("Place a toolbar with counter and buttons at the bottom")
                    font: Kirigami.Theme.smallFont
                    opacity: 0.7
                    leftPadding: showToolbarPanel.indicator.width + showToolbarPanel.spacing
                }
            }

            ColumnLayout {
                Layout.leftMargin: Kirigami.Units.largeSpacing

                CheckBox {
                    id: showOnlyTitles
                    text: i18n("Hide snippet previews")
                }

                Label {
                    text: i18n("Show only snippet titles without content previews")
                    font: Kirigami.Theme.smallFont
                    opacity: 0.7
                    leftPadding: showOnlyTitles.indicator.width + showOnlyTitles.spacing
                }
            }

            Item { implicitHeight: Kirigami.Units.largeSpacing }

            Kirigami.Separator {
                Kirigami.FormData.isSection: true
            }

            Item { implicitHeight: Kirigami.Units.largeSpacing }

            ColumnLayout {
                Kirigami.FormData.isSection: true

                Kirigami.Heading {
                    text: i18n("Functionality")
                    level: 2
                    Layout.leftMargin: Kirigami.Units.largeSpacing
                }

                Label {
                    text: i18n("Configure behavior and limitations")
                    font: Kirigami.Theme.smallFont
                    opacity: 0.7
                    Layout.leftMargin: Kirigami.Units.largeSpacing
                }
            }

            Item { implicitHeight: Kirigami.Units.smallSpacing }

            ColumnLayout {
                Layout.leftMargin: Kirigami.Units.largeSpacing

                RowLayout {
                    spacing: Kirigami.Units.smallSpacing

                    Label {
                        text: i18n("Maximum number of snippets:")
                        Layout.alignment: Qt.AlignVCenter
                    }

                    SpinBox {
                        id: maxSnippetsSpinner
                        from: 10
                        to: 100
                        stepSize: 5
                        Layout.alignment: Qt.AlignVCenter
                    }
                }

                Label {
                    text: i18n("Limit the number of snippets for optimal performance")
                    font: Kirigami.Theme.smallFont
                    opacity: 0.7
                }
            }

            Item { implicitHeight: Kirigami.Units.smallSpacing }

            ColumnLayout {
                Layout.leftMargin: Kirigami.Units.largeSpacing

                CheckBox {
                    id: useKbdNavigation
                    text: i18n("Keyboard navigation")
                    visible: isPanel
                    enabled: visible
                }

                Label {
                    text: i18n("Use the keyboard keys to navigate and select snippets")
                    font: Kirigami.Theme.smallFont
                    opacity: 0.7
                    leftPadding: useKbdNavigation.indicator.width + useKbdNavigation.spacing
                    visible: isPanel
                }
            }
        }
    }
}