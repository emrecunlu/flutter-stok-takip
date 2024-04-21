import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/base/base_view.dart';
import 'package:flutter_stok_takip/core/base/base_widget.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_add_screen/widgets/build_address_filed.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_add_screen/widgets/build_firstname_field.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_add_screen/widgets/build_lastname_field.dart';
import 'package:flutter_stok_takip/ui/screens/customer/customer_add_screen/widgets/build_tcnumber_filed.dart';
import 'package:flutter_stok_takip/ui/viewmodels/customer/customer_create_viewmodel.dart';
import 'package:flutter_stok_takip/ui/widgets/common/build_submit_button.dart';

class CustomerAddScreen extends StatefulWidget {
  final CustomerModel? toUpdate;

  const CustomerAddScreen({
    super.key,
    this.toUpdate,
  });

  @override
  State<CustomerAddScreen> createState() => _CustomerAddScreenState();
}

class _CustomerAddScreenState extends BaseWidget<CustomerAddScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (model) {
        if (widget.toUpdate != null) {
          model.fillForm(widget.toUpdate!);
        }
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Form(
            key: model.form.formKey,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  BuildFirstNameField(),
                  verticalMargin(16),
                  BuildLastNameField(),
                  verticalMargin(16),
                  BuildTcNumberField(),
                  verticalMargin(16),
                  BuildAddressField(),
                  verticalMargin(24),
                  BuildSubmitButon(
                    onPressed: () {
                      model.submit(widget.toUpdate);
                    },
                    isUpdate: widget.toUpdate != null,
                  ),
                ],
              ),
            ),
            autovalidateMode: AutovalidateMode.disabled,
          ),
        );
      },
      model: CustomerCreateViewModel(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Müşteri ${widget.toUpdate != null ? 'Güncelle' : 'Ekle'}'),
    );
  }
}
