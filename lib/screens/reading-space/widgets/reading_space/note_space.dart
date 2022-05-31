import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NoteSpace extends StatefulWidget {
  const NoteSpace({Key? key}) : super(key: key);

  @override
  State<NoteSpace> createState() => _NoteSpaceState();
}

class _NoteSpaceState extends State<NoteSpace> {
  String initialText =
      '<p><strong><span style="font-size: 30px;">Ghi Ch&uacute;<img src="https://firebasestorage.googleapis.com/v0/b/library-online-3ec9d.appspot.com/o/Notes%2FImages%2F1641442302459?alt=media&token=dcd5f82f-970a-4d9c-9d02-54885b16efcc" style="width: 496px;" class="fr-fic fr-dib"></span></strong></p><p><span style="font-size: 18px;">Khoảng th&aacute;ng 2&nbsp;năm 2003, t&ocirc;i đột nhi&ecirc;n được mời tới Ba Lan để quảng b&aacute;cho cuốn s&aacute;ch. <strong>Ở trạm dừng đầu ti&ecirc;n tại Warsaw, ph&iacute;a đối t&aacute;c đ&atilde; cử bốn vệ sĩmặc com-l&ecirc; với bộ đ&agrave;m cầm tay hệt như người của Sở Mật vụ để phụ tr&aacute;chvấn đề an to&agrave;n của t&ocirc;i. T&ocirc;i cười lớn, cho rằng điều n&agrave;y thật kỳ cục. Hiểnnhi&ecirc;n l&agrave; t&ocirc;i kh&ocirc;ng cần được bảo vệ.</strong></span></p>';
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
        child: Column(
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
                  initialText: initialText,
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarPosition: ToolbarPosition.aboveEditor, //by default
                  toolbarType: ToolbarType.nativeScrollable, //by default
                  onButtonPressed:
                      (ButtonType type, bool? status, Function? updateStatus) {
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
                callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
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
                        var mentions = <String>['test1', 'test2', 'test3'];
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
      ),
    );
  }
}
