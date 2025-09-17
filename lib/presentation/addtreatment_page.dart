import 'package:ayurvedic_centre/presentation/constants/colors.dart';
import 'package:ayurvedic_centre/presentation/constants/textstyle.dart';
import 'package:ayurvedic_centre/presentation/widgets/custom_textfield.dart';
import 'package:ayurvedic_centre/presentation/widgets/dropdownfield.dart';
import 'package:flutter/material.dart';

class AddtreatmentPage extends StatefulWidget {
  const AddtreatmentPage({super.key});

  @override
  State<AddtreatmentPage> createState() => _AddtreatmentPageState();
}

class _AddtreatmentPageState extends State<AddtreatmentPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String? _paymentOption;

    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.notifications_on_outlined)],

        actionsPadding: EdgeInsets.only(right: 20),
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5,
                ),
                child: Text("Register", style: AppTextStyles.contentstyle),
              ),
              Divider(color: AppColors.hintcolor, height: 1),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              CustomTextField(
                controller: controller,
                labelText: "Name",
                hintText: "Enter your full Name",
              ),
              CustomTextField(
                controller: controller,
                labelText: "Whatsapp Number",
                hintText: "Enter your Whatsapp Number",
              ),
              CustomTextField(
                controller: controller,
                labelText: "Address",
                hintText: "Enter your full Address",
              ),
              CustomDropField(
                controller: controller,
                labelText: "Location",
                hintText: "Choose Your Location",
              ),
              CustomDropField(
                controller: controller,
                labelText: "Branch",
                hintText: "Select the Branch",
              ),

              Text("Treatment", style: AppTextStyles.labelstyle),
              const SizedBox(height: 8.0),

              Container(
                color: AppColors.filledcolor,
                width: double.infinity,
                height: 120,
              ),
              const SizedBox(height: 8.0),

              ElevatedButton.icon(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Payment()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: AppColors.unselectedcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.add, color: AppColors.white),
                label: const Text(
                  'Add TreatmentS',
                  style: AppTextStyles.mainButtonstyle,
                ),
              ),
              const SizedBox(height: 16.0),

              CustomTextField(
                controller: controller,
                labelText: "Total Amount",
                hintText: "",
              ),
              CustomTextField(
                controller: controller,
                labelText: "Discount Amount",
                hintText: "",
              ),
              Text("Payment Option", style: AppTextStyles.labelstyle),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Radio<String>(
                    value: 'Cash',
                    groupValue: _paymentOption,
                    onChanged: (value) {
                      setState(() {
                        _paymentOption = value;
                      });
                    },
                  ),
                  const Text('Cash', style: AppTextStyles.labelstyle),
                  Spacer(),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'Card',
                    groupValue: _paymentOption,
                    onChanged: (value) {
                      setState(() {
                        _paymentOption = value;
                      });
                    },
                  ),
                  const Text('Card', style: AppTextStyles.labelstyle),
                  Spacer(),

                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'Upi',
                    groupValue: _paymentOption,
                    onChanged: (value) {
                      setState(() {
                        _paymentOption = value;
                      });
                    },
                  ),
                  const Text('Upi', style: AppTextStyles.labelstyle),
                ],
              ),

              // ////////////////////////////////////
              CustomTextField(
                controller: controller,
                labelText: "Advance Amount",
                hintText: "",
              ),
              CustomTextField(
                controller: controller,
                labelText: "Balance Amount",
                hintText: "",
              ),
              CustomTextField(
                controller: controller,
                labelText: "Treatment Date",
                hintText: "",
                iconData: Icons.calendar_month,
              ),

              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: CustomDropField(
                      controller: controller,
                      labelText: "Treatment",
                      hintText: "Hour",
                    ),
                  ),
                  Expanded(
                    child: CustomDropField(
                      controller: controller,
                      labelText: "",
                      hintText: "Minute",
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: AppColors.iconcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Save', style: AppTextStyles.mainButtonstyle),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
