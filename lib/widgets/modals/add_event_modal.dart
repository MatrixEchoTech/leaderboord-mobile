import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/flutter_dropzone.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddEventModal extends StatefulWidget {
  final VoidCallback? onSubmit; // just a callback, no form data

  const AddEventModal({super.key, this.onSubmit}); // removed const for hot reload

  @override
  State<AddEventModal> createState() => _MakeChangeModalState();
}

bool reminderEnabled = false; // Track switch state
bool reminderEnabled2 = false;

class _MakeChangeModalState extends State<AddEventModal> {
  String? selectedUpdateType;
  final List<String> updateTypes = [
    "Exterior",
    "Interior",
    "Engine",
    "Insurance",
    "Services",
    "Valet",
    "Suspension",
  ];
  bool rememberMe = false;
  final TextEditingController newDataController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  OverlayEntry? _calendarOverlay;

  void _showCalendar(BuildContext fieldContext) {
  if (_calendarOverlay != null) {
    _calendarOverlay!.remove();
    _calendarOverlay = null;
    return;
  }

  final renderBox = fieldContext.findRenderObject() as RenderBox;
  final offset = renderBox.localToGlobal(Offset.zero);

  final today = DateTime.now();
  final firstDate = DateTime(today.year, today.month, today.day); // today only, no past

  _calendarOverlay = OverlayEntry(
    builder: (context) => Stack(
      children: [
        GestureDetector(
          onTap: () {
            _calendarOverlay?.remove();
            _calendarOverlay = null;
          },
          behavior: HitTestBehavior.translucent,
        ),
        Positioned(
          left: offset.dx,
          top: offset.dy + renderBox.size.height + 4,
          width: renderBox.size.width,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 300,
              child: CalendarDatePicker(
                initialDate: firstDate, // start with today
                firstDate: firstDate,   // disable past dates
                lastDate: DateTime(2100),
                onDateChanged: (pickedDate) {
                  dateController.text =
                      "${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.year}";
                  _calendarOverlay?.remove();
                  _calendarOverlay = null;
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Overlay.of(context).insert(_calendarOverlay!);
}

  @override
  void dispose() {
    _calendarOverlay?.remove();
    newDataController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    // Card width for large screens
    final cardWidth = isLargeScreen ? 600.0 : screenWidth;

    return Scaffold(
      backgroundColor: Color(0xFF171C29),
      body: Center(
        child: Container(
          width: cardWidth,
          height: isLargeScreen ? null : screenHeight,
          padding: const EdgeInsets.all(24),
          margin: isLargeScreen
              ? const EdgeInsets.symmetric(vertical: 32)
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: const Color(0xFF171C29),
            borderRadius: BorderRadius.circular(isLargeScreen ? 24 : 0),
            border: Border.all(color: const Color(0xFF23283A)),
            boxShadow: isLargeScreen
                ? const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    ),
                  ]
                : null,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Add New Car Journey Event",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                //event title
                Text(
                  "Event Title",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400],
                  ),
                ),
                TextFormField(
                  controller: newDataController,
                  decoration: const InputDecoration(
                    hintText: "Enter here",
                    hintStyle: TextStyle(color: Colors.white38),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                // Date Applied
                Text(
                  "Event Date",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 4),
                Builder(
                  builder: (fieldContext) => TextFormField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => _showCalendar(fieldContext),
                    decoration: const InputDecoration(
                      hintText: "Select date",
                      hintStyle: TextStyle(color: Colors.white38),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),

                // Update Type Dropdown
                Text(
                  "Category",
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
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  hint: Text(
                    "Select Category",
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
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    offset: Offset(0, 0),
                    decoration: BoxDecoration(color: Color(0xFF171C29)),
                  ),
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
                  minLines: 2,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Enter here",
                    hintStyle: TextStyle(color: Colors.white38),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Photo (Optional)",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),   const SizedBox(height: 6),
                    const CrossPlatformDropzone(),
                    const SizedBox(height: 16),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT SIDE (Texts)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Visibility Option",
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Is it visible to anyone?",
                            style: GoogleFonts.lato(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: reminderEnabled,
                        onChanged: (v) => setState(() => reminderEnabled = v),
                        activeThumbColor: Colors.white, // thumb color when ON
                        inactiveThumbColor:
                            Colors.white, // thumb color when OFF
                        trackColor: WidgetStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.blueAccent; // track color when ON
                          }
                          return Color(0xFF374151); // track color when OFF
                        }),
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ), // removes ripple/overlay
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT SIDE (Texts)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reminder",
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "You will get a reminder by email on the event date.",
                            style: GoogleFonts.lato(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: reminderEnabled2,
                        onChanged: (v) => setState(() => reminderEnabled2 = v),
                        activeThumbColor: Colors.white, // thumb color when ON
                        inactiveThumbColor:
                            Colors.white, // thumb color when OFF
                        trackColor: WidgetStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.blueAccent; // track color when ON
                          }
                          return Color(0xFF374151); // track color when OFF
                        }),
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ), // removes ripple/overlay
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Submit Button
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF23283A),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          minimumSize: const Size.fromHeight(
                            48,
                          ), // fixed height
                        ),
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed:
                            widget.onSubmit ??
                            () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF171C29),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          minimumSize: const Size.fromHeight(
                            48,
                          ), // fixed height
                        ),
                        child: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
