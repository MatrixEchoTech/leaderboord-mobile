import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsGarage extends StatefulWidget {
  const CommentsGarage({super.key});

  @override
  State<CommentsGarage> createState() => _CommentsGarageState();
}

class _CommentsGarageState extends State<CommentsGarage> {
  final TextEditingController _controller = TextEditingController();

  /// List of comments
  List<Map<String, String>> comments = [
    {
      "name": "Ethan Parker",
      "time": "2d 4h ago",
      "comment": "test comment",
    }
  ];

  /// Function to add new comment
  void addComment() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      comments.insert(0, {
        "name": "You",
        "time": "Just now",
        "comment": text,
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// --- Heading ---
        Text(
          "Comments",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        /// --- All Comments Dynamically ---
        for (var c in comments) ...[
          _buildCommentCard(c),
          const SizedBox(height: 14),
        ],

        const SizedBox(height: 10),

        /// Comments Count
        Text(
          "See more comments",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "${comments.length} out of 15 comments",
          style: GoogleFonts.inter(
            color: const Color(0xFFD5D5D5),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 20),

        /// --- Input Field ---
        TextField(
          controller: _controller,
          maxLines: 1,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: "Type Something ...",
            hintStyle: GoogleFonts.inter(color: Colors.white54, fontSize: 14),
            filled: true,
            fillColor: const Color(0xFF171C29),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF343B4F), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1.2),
            ),
          ),
        ),

        const SizedBox(height: 15),

        /// --- Post Button ---
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: addComment,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              "Post Comment",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF0A1330),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// --- UI for individual comment ---
 Widget _buildCommentCard(Map<String, String> data) {
  bool isUser = data["name"] == "You"; // check if it's your comment

  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFF171C29),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFF444444)),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            'images/user2.png',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["name"]!,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                data["time"]!,
                style: GoogleFonts.poppins(
                  color: const Color(0x66FFFFFF),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                data["comment"]!,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        /// --- DELETE if your comment, REPORT otherwise ---
        GestureDetector(
          onTap: () {
            if (isUser) {
              // delete the comment
              setState(() {
                comments.remove(data);
              });
            } else {
              // future: report function
            }
          },
          child: Text(
            isUser ? "Delete" : "Report",
            style: GoogleFonts.lato(
              color: isUser ?  Colors.white : const Color(0xFFA3A3A3),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

}
