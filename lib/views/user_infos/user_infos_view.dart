import 'package:flutter/material.dart';
import 'package:takali/themes/colors.dart';
import 'package:takali/viewmodels/user_infos_viewmodel.dart';
import 'package:takali/views/base.view.dart';
import 'package:takali/helpers/extensions/textstyle.dart';
import 'package:takali/helpers/extensions/media_query.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<UserInfoViewModel>(
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 240, 193),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: context.screenHeight * 0.05,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tes informations',
                  style: context.displayLarge.copyWith(
                    color: AppColors.secondary,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.05),

                // Prénom
                _buildTextField(
                  label: 'Prénom',
                  hint: 'Ton prénom',
                  onSaved: (value) => model.firstName = value,
                ),

                SizedBox(height: context.screenHeight * 0.03),

                // Date de naissance
                TextFormField(
                  controller: _birthDateController,
                  decoration: _inputDecoration('Ta date de naissance', Icons.calendar_today),
                  readOnly: true,
                  onTap: () => _selectDate(context, model),
                  validator: (value) => value!.isEmpty ? 'Champ obligatoire' : null,
                ),
                SizedBox(height: context.screenHeight * 0.03),

                // Genre
                _buildDropdown(
                  items: const ['Homme', 'Femme'],
                  hint: 'Ton genre',
                  onChanged: (value) => model.gender = value!,
                ),
                SizedBox(height: context.screenHeight * 0.03),

                // Genre préféré
                _buildDropdown(
                  items: const ['Homme', 'Femme'],
                  hint: 'Tu préfères rencontrer',
                  onChanged: (value) => model.preferredGender = value!,
                ),
                SizedBox(height: context.screenHeight * 0.03),

                // Localisation
                _buildTextField(
                  label: 'Localisation approximative',
                  hint: 'Boulevard de la Marina, Cotonou',
                  icon: Icons.location_on,
                  onSaved: (value) => model.location = value,
                ),
                SizedBox(height: context.screenHeight * 0.05),

                // Bouton de validation
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => _submitForm(model),
                    child: Text(
                      'Continuer',
                      style: context.bodyMedium.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    Function(String)? onSaved,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   label,
        //   style: context.bodyMedium.copyWith(
        //     color: AppColors.secondary,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: _inputDecoration(hint, icon),
          onSaved: (value) => onSaved?.call(value!),
          validator: (value) => value!.isEmpty ? 'Champ obligatoire' : null,
        ),
      ],
    );
  }

  Widget  _buildDropdown({
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      borderRadius: BorderRadius.circular(12),
      decoration: _inputDecoration(hint, null),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? 'Champ obligatoire' : null,
    );
  }

  InputDecoration _inputDecoration(String hint, IconData? icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      suffixIcon: icon != null ? Icon(icon, color: AppColors.secondary) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  Future<void> _selectDate(BuildContext context, model) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text = "${picked.day}/${picked.month}/${picked.year}";
        model.birthDate = picked;
      });
    }
  }

  void _submitForm(model) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Soumission des données
      model.submitUserInfo();
    }
  }
}
