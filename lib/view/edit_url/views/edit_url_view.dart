import 'package:flutter/material.dart';
import 'package:architecture_widgets/src/button/title_text_button.dart';
import 'package:kartal/kartal.dart';
import '../../../core/base/view/base_widget.dart';
import '../../menu/model/subject_model.dart';
import '../service/edit_url_service.dart';
import '../viewmodel/edit_url_view_model.dart';

class EditUrlView extends StatefulWidget {
  const EditUrlView({
    super.key,
    required this.menuItem,
  });

  final SubjectModel? menuItem;
  @override
  State<EditUrlView> createState() => _EditUrlViewState();
}

class _EditUrlViewState extends State<EditUrlView> {
  final _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _textEditingController.text = widget.menuItem?.url ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<EditUrlViewModel>(
      viewModel: EditUrlViewModel(
        EditUrlService(),
        model: widget.menuItem,
      ),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: _buildScaffoldBody,
    );
  }

  Widget _buildScaffoldBody(BuildContext context, EditUrlViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                viewModel.model?.name ?? "",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              _buildTextField(viewModel),
              const SizedBox(height: 20),
              TitleTextButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    viewModel.updateUrl(_textEditingController.text);
                  }
                },
                text: "Cập nhật",
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        "Cập nhật URL",
        style: context.textTheme.headlineSmall?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildTextField(EditUrlViewModel viewModel) {
    return TextFormField(
      controller: _textEditingController,
      maxLines: 10,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      decoration: const InputDecoration(
        hintText: "Nhập URL",
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color.fromARGB(255, 39, 112, 220),
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color.fromARGB(255, 39, 112, 220),
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Vui lòng nhập URL';
        } else if (!viewModel.isValidURL(text)) {
          return 'Vui lòng nhập URL hợp lệ';
        }
        return null;
      },
    );
  }
}
