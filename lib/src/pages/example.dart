import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final ScrollController _scrollController = ScrollController();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final colors = Zeta.of(context).colors;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          const ZetaAccordion(
            title: 'Accordion',
            child: Text('Expanded'),
          ),
          ZetaAvatar(
            initials: 'AZ',
            borderColor: colors.primary,
            upperBadge: const ZetaAvatarBadge.notification(value: 10),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                ZetaStatusLabel(label: 'Status label'),
                ZetaPriorityPill(label: 'Priority Pill'),
                ZetaLabel(label: 'Label'),
                ZetaIndicator.icon(),
                ZetaIndicator.notification(),
                ZetaTag.left(label: 'Tag'),
              ].gap(ZetaSpacing.xl_2),
            ).paddingHorizontal(ZetaSpacing.xl_2),
          ),
          ZetaBanner(context: context, title: 'Banner'),
          ZetaBreadCrumbs(
            children: [
              ZetaBreadCrumb(label: 'BreadCrumb', onPressed: () {}),
              ZetaBreadCrumb(label: 'BreadCrumb', onPressed: () {}),
              ZetaBreadCrumb(label: 'BreadCrumb', onPressed: () {}),
              ZetaBreadCrumb(label: 'BreadCrumb', onPressed: () {}),
              ZetaBreadCrumb(label: 'BreadCrumb', onPressed: () {}),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ZetaButton(
                  label: 'Open Dialog',
                  onPressed: () {
                    showZetaDialog(
                      context,
                      message: 'Lorem Ipsum',
                      icon: const Icon(ZetaIcons.steps_sharp),
                      title: 'Dialog',
                      primaryButtonLabel: 'Button',
                    );
                  },
                ),
                ZetaIconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      ZetaSnackBar(
                        context: context,
                        onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                        actionLabel: 'Action',
                        content: const Text('Snackbar'),
                      ),
                    );
                  },
                ),
                ZetaFAB(
                  scrollController: _scrollController,
                  label: 'FAB',
                  onPressed: () {},
                ),
                ZetaButtonGroup(
                  buttons: [
                    ZetaGroupButton(onPressed: () {}, label: 'Group'),
                    ZetaGroupButton(onPressed: () {}, label: 'Button'),
                  ],
                  rounded: true,
                  isLarge: true,
                ),
              ].gap(ZetaSpacing.xl_2),
            ).paddingHorizontal(ZetaSpacing.xl_2),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ZetaCheckbox(
                  label: 'Checkbox',
                  value: checked,
                  useIndeterminate: true,
                  onChanged: (bool? change) => setState(() => checked = change ?? false),
                ),
                ZetaRadio(
                  value: 'Radio',
                  label: const Text('Radio'),
                  onChanged: (b) {
                    setState(() => checked = !checked);
                  },
                  groupValue: checked ? 'Radio' : '',
                ),
                ZetaSwitch(
                  value: checked,
                  onChanged: (b) => setState(() {
                    checked = b ?? false;
                  }),
                ),
              ].gap(ZetaSpacing.xl_2),
            ).paddingHorizontal(ZetaSpacing.xl_2),
          ),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const ZetaFilterChip(label: 'Filter Chip'),
                    const ZetaInputChip(
                      label: 'Input Chip',
                      leading: ZetaAvatar(initials: 'AZ', size: ZetaAvatarSize.xxxs),
                    ),
                    const ZetaAssistChip(label: 'Assist Chip', leading: Icon(ZetaIcons.star_round)),
                  ].gap(ZetaSpacing.xl_2),
                ).paddingHorizontal(ZetaSpacing.xl_2),
              ),
              ZetaFilterSelection(
                items: List.generate(10, (e) => e).map((e) => ZetaFilterChip(label: 'Filter Chip ${e + 1}')).toList(),
              ),
            ],
          ),
          const ZetaDialPad(),
          ZetaDropdown(
            onChange: (value) {},
            items: [
              ZetaDropdownItem(value: 'Dropdown item', icon: const Icon(ZetaIcons.add_box_sharp)),
              ZetaDropdownItem(value: 'Dropdown item 2', icon: const Icon(ZetaIcons.activity_round)),
            ],
          ),
          ZetaGlobalHeader(
            title: 'Global Header',
            actionButtons: [IconButton(onPressed: () {}, icon: const Icon(ZetaIcons.hand_round))],
            onAppsButton: () {},
            tabItems: const [
              ZetaGlobalHeaderItem(label: 'Item 1'),
              ZetaGlobalHeaderItem(label: 'Item 2'),
              ZetaGlobalHeaderItem(label: 'Item 3'),
            ],
            avatar: const ZetaAvatar.initials(initials: 'AZ'),
          ),
          Column(
            children: [
              ZetaListItem(
                primaryText: 'List Item',
                onTap: () => setState(() {
                  checked = !checked;
                }),
              ),
              ZetaContactItem(
                title: const Text('Contact Item'),
                leading: const ZetaAvatar(initials: 'AZ', size: ZetaAvatarSize.m),
                subtitle: const Text('Subtitle'),
                onTap: () {},
              ),
              ZetaChatItem(
                title: const Text('Chat Item'),
                subtitle: const Text('subtitle'),
                leading: const ZetaAvatar(initials: 'AZ', size: ZetaAvatarSize.m),
                starred: true,
                count: 19,
                enabledNotificationIcon: true,
                enabledWarningIcon: true,
                onTap: () {},
                time: DateTime.now(),
                slidableActions: [
                  ZetaSlidableAction.call(onPressed: () {}),
                  ZetaSlidableAction.delete(onPressed: () {}),
                ],
              ),
            ],
          ),
          const ZetaPagination(pages: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 250, child: ZetaDateInput(label: 'Date Input')),
                SizedBox(width: 250, child: ZetaPasswordInput(label: 'Password input')),
                SizedBox(width: 250, child: ZetaPhoneInput(label: 'Phone Input')),
                SizedBox(width: 250, child: ZetaTimeInput(label: 'Phone Input')),
                SizedBox(width: 250, child: ZetaTextInput(label: 'Phone Input')),
                SizedBox(
                  width: 250,
                  child: ZetaSelectInput(
                    label: 'Select Input',
                    items: [
                      ZetaDropdownItem(value: 'Item 1'),
                      ZetaDropdownItem(value: 'Item 2'),
                      ZetaDropdownItem(value: 'Item 3'),
                      ZetaDropdownItem(value: 'Item 4'),
                      ZetaDropdownItem(value: 'Item 5'),
                    ],
                  ),
                ),
              ].gap(ZetaSpacing.xl_2),
            ).paddingHorizontal(ZetaSpacing.xl_2),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 250,
                  child: ZetaProgressBar(progress: 1, type: ZetaProgressBarType.indeterminate),
                ),
                const SizedBox(width: 250, child: ZetaProgressBar(progress: 1, type: ZetaProgressBarType.buffering)),
                const SizedBox(width: 250, child: ZetaProgressBar(progress: 1, type: ZetaProgressBarType.standard)),
                const ZetaProgressCircle(progress: 1, size: ZetaCircleSizes.s),
              ].gap(ZetaSpacing.xl_2),
            ).paddingHorizontal(ZetaSpacing.xl_2),
          ),
          ZetaScreenHeaderBar(
            actionButtonLabel: 'Action',
            onActionButtonPressed: () {},
            title: const Text('Screen Header Bar'),
          ),
          ZetaSearchBar(),
          ZetaSegmentedControl(
            segments: const [
              ZetaButtonSegment(value: 1, child: Text('Segmented')),
              ZetaButtonSegment(value: 2, child: Text('Button')),
            ],
            onChanged: (v) {
              setState(() {
                checked = v == 1;
              });
            },
            selected: checked ? 1 : 2,
          ),
          const SizedBox(
            height: 150,
            child: ZetaStepper(
              steps: [
                ZetaStep(title: Text('Step 1'), type: ZetaStepType.complete),
                ZetaStep(title: Text('Step 2'), type: ZetaStepType.enabled),
                ZetaStep(title: Text('Step 3')),
              ],
              currentStep: 1,
            ),
          ),
          ZetaStepperInput(onChange: (_) => {}),
          DefaultTabController(
            length: 2,
            child: ZetaTabBar(
              context: context,
              tabs: [
                ZetaTab(text: 'Tab', icon: const Icon(ZetaIcons.zero_scale_round)),
                ZetaTab(text: 'Bar', icon: const Icon(ZetaIcons.activity_round)),
              ],
            ),
          ),
          const ZetaTooltip(child: Text('Tooltip')),
          const SizedBox(height: 100),
        ].gap(ZetaSpacing.xl_10),
      ),
    );
  }
}
