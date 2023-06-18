import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:smart_school/view/create_school/model/province_model.dart';
import 'package:smart_school/view/create_school/service/create_school_service.dart';
import 'package:architecture_widgets/src/button/title_text_button.dart';
import '../../../core/base/view/base_widget.dart';
import '../viewmodel/create_school_viewmodel.dart';

class CreateSchoolView extends StatefulWidget {
  const CreateSchoolView({super.key});

  @override
  State<CreateSchoolView> createState() => _CreateSchoolViewState();
}

class _CreateSchoolViewState extends State<CreateSchoolView> {
  final _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ProvinceModel? selectedItem;

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateSchoolViewModel>(
      viewModel: CreateSchoolViewModel(
        CreateSchoolService(),
      ),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: _buildScaffoldBody,
    );
  }

  Widget _buildScaffoldBody(
      BuildContext context, CreateSchoolViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                "Chọn tỉnh thành",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              _buildDropdown(viewModel),
              const SizedBox(height: 20),
              _buildTextField(viewModel),
              const SizedBox(height: 20),
              _buildCreateButton(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  TitleTextButton _buildCreateButton(CreateSchoolViewModel viewModel) {
    return TitleTextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  viewModel.createSchool(
                      _textEditingController.text, selectedItem);
                }
              },
              text: "Tạo mới",
            );
  }

  Widget _buildDropdown(CreateSchoolViewModel viewModel) {
    return Observer(
      builder: (_) => Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<ProvinceModel>(
            isExpanded: true,
            value: selectedItem,
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
            },
            underline: Container(
              height: 0,
            ),
            items: viewModel.provinceList.map((province) {
              return DropdownMenuItem(
                value: province,
                child: Text(province.name ?? ""),
              );
            }).toList(),
            hint: const Text('Danh sách tỉnh...'),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Tạo trường mới",
        style: context.textTheme.headlineSmall?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildTextField(CreateSchoolViewModel viewModel) {
    return TextFormField(
      controller: _textEditingController,
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      decoration: const InputDecoration(
        hintText: "Nhập tên trường",
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
          return 'Vui lòng nhập tên trường';
        }
        return null;
      },
    );
  }
}
