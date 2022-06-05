import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:library_online_application/models/note.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../icons/bee_app_icons.dart';

class NoteSpace extends StatefulWidget {
  final Note note;
  const NoteSpace({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteSpace> createState() => _NoteSpaceState();
}

class _NoteSpaceState extends State<NoteSpace> {
  String result = '';
  final HtmlEditorController _controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      backdropEnabled: true,
      backdropOpacity: 0.3,
      minHeight: 30,
      maxHeight: 400,
      onPanelClosed: () {
        _controller.clearFocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      panel: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: 90,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF9B700),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: HtmlEditor(
                      controller: _controller,
                      htmlEditorOptions: HtmlEditorOptions(
                        hint: 'Your text here...',
                        shouldEnsureVisible: true,
                        initialText: widget.note.content,
                      ),
                      htmlToolbarOptions: HtmlToolbarOptions(
                        toolbarPosition:
                            ToolbarPosition.aboveEditor, //by default
                        toolbarType: ToolbarType.nativeScrollable, //by default
                        onButtonPressed: (ButtonType type, bool? status,
                            Function? updateStatus) {
                          print(
                              "button '${describeEnum(type)}' pressed, the current selected status is $status");
                          return true;
                        },
                        onDropdownChanged: (DropdownType type, dynamic changed,
                            Function(dynamic)? updateSelectedItem) {
                          print(
                              "dropdown '${describeEnum(type)}' changed to $changed");
                          return true;
                        },
                        mediaLinkInsertInterceptor:
                            (String url, InsertFileType type) {
                          print(url);
                          return true;
                        },
                      ),
                      otherOptions: OtherOptions(height: 550),
                      callbacks: Callbacks(
                          onBeforeCommand: (String? currentHtml) {
                        print('html before change is $currentHtml');
                      }, onChangeContent: (String? changed) {
                        print('content changed to $changed');
                      }, onChangeCodeview: (String? changed) {
                        print('code changed to $changed');
                      }, onChangeSelection: (EditorSettings settings) {
                        print('parent element is ${settings.parentElement}');
                        print('font name is ${settings.fontName}');
                      }, onDialogShown: () {
                        print('dialog shown');
                      }, onEnter: () {
                        print('enter/return pressed');
                      }, onFocus: () {
                        print('editor focused');
                      }, onBlur: () {
                        print('editor unfocused');
                      }, onBlurCodeview: () {
                        print('codeview either focused or unfocused');
                      }, onInit: () {
                        print('init');
                      },
                          //this is commented because it overrides the default Summernote handlers
                          /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                          onKeyDown: (int? keyCode) {
                        print('$keyCode key downed');
                        print(
                            'current character count: ${_controller.characterCount}');
                      }, onKeyUp: (int? keyCode) {
                        print('$keyCode key released');
                      }, onMouseDown: () {
                        print('mouse downed');
                      }, onMouseUp: () {
                        print('mouse released');
                      }, onNavigationRequestMobile: (String url) {
                        print(url);
                        return NavigationActionPolicy.ALLOW;
                      }, onPaste: () {
                        print('pasted into editor');
                      }, onScroll: () {
                        print('editor scrolled');
                      }),
                      plugins: [
                        SummernoteAtMention(
                            getSuggestionsMobile: (String value) {
                              var mentions = <String>[
                                'test1',
                                'test2',
                                'test3'
                              ];
                              return mentions
                                  .where((element) => element.contains(value))
                                  .toList();
                            },
                            mentionsWeb: ['test1', 'test2', 'test3'],
                            onSelect: (String value) {
                              print(value);
                            }),
                      ],
                    ),
                  ))
                ],
              ),
              Positioned(
                  top: 31,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 50,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              onTap: () {
                                _controller.undo();
                              }, // Handle your onTap
                              child: Ink(
                                child: const Icon(
                                  BeeAppIcons.undo,
                                  color: Color(0xFF027B76),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 50,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              onTap: () {
                                _controller.redo();
                              }, // Handle your onTap
                              child: Ink(
                                child: const Icon(
                                  BeeAppIcons.redo,
                                  color: Color(0xFF027B76),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
