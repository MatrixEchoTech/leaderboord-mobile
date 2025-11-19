import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MakeChangeModal extends StatefulWidget {
  final Function onSubmit;
  final bool submitting;

  const MakeChangeModal({
    super.key,
    required this.onSubmit,
    this.submitting = false,
  });

  @override
  State<MakeChangeModal> createState() => _MakeChangeModalState();
}

class _MakeChangeModalState extends State<MakeChangeModal> {
  final _formKey = GlobalKey<FormState>();
  String? selectedUpdateType;
  final List<String> updateTypes = [
    "Engine Update",
    "Tire Change",
    "Oil Change",
    "Interior Upgrade",
  ];

  final TextEditingController newDataController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  bool confirm = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Color(0xFF171C29),
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Container(
                width: isLargeScreen ? 600 : double.infinity,
                height: isLargeScreen ? null : screenHeight,
                padding: const EdgeInsets.all(24),
                margin: isLargeScreen
                    ? const EdgeInsets.symmetric(vertical: 32)
                    : EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: const Color(0xFF171C29),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF23283A)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: isLargeScreen
                        ? MainAxisSize.min
                        : MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Submit Car Update",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Update Type Dropdown
                      Text(
                        "Update Type",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(height: 4),
                      DropdownButtonFormField2<String>(
                        value: selectedUpdateType,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        hint: Text(
                          "Select Update Type",
                          style: TextStyle(color: Colors.white38),
                        ),
                        style: TextStyle(color: Colors.white),
                        items: updateTypes
                            .map(
                              (type) => DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedUpdateType = value;
                          });
                        },
                        validator: (value) => value == null ? 'Required' : null,

                        // 🔹 This is the key for controlling dropdown position
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 300,
                          offset: Offset(
                            0,
                            0,
                          ), // dropdown will appear below the field
                          decoration: BoxDecoration(color: Color(0xFF171C29)),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // New Data
                      Text(
                        "New Data",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[400],
                        ),
                      ),
                      TextFormField(
                        controller: newDataController,
                        decoration: const InputDecoration(
                          hintText: "Enter new data",
                          hintStyle: TextStyle(color: Colors.white38),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),

                      // Date Applied
                      Text(
                        "Date Applied",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[400],
                        ),
                      ),
                      TextFormField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          hintText: "mm-dd-yyyy",
                          hintStyle: TextStyle(color: Colors.white38),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),

                      // Description
                      Text(
                        "Description",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[400],
                        ),
                      ),
                      TextFormField(
                        controller: descriptionController,
                        minLines: 3,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: "Enter here",
                          hintStyle: TextStyle(color: Colors.white38),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        "Upload Evidence ",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),

                      // Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: confirm,

                            onChanged: (val) {
                              setState(() {
                                confirm = val ?? false;
                              });
                            },

                            activeColor: const Color(0xFF4C98F1),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "I confirm this data is accurate",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFF23283A),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: const Text("Cancel"),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: widget.submitting || !confirm
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        widget.onSubmit(
                                          selectedUpdateType,
                                          newDataController.text,
                                          dateController.text,
                                          descriptionController.text,
                                        );
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF171C29),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: Text(
                                widget.submitting ? "Submitting..." : "Submit",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
