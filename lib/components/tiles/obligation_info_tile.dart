import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ObligationInfoTile extends StatefulWidget {
  final String title;
  final String token;
  final double width;
   
  const ObligationInfoTile({super.key, required this.title, required this.token, required this.width});

  @override
  State<ObligationInfoTile> createState() => _ObligationInfoTileState();
}

class _ObligationInfoTileState extends State<ObligationInfoTile> {
  bool showAmount = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Obligation Information',
                style: TextStyle(
                  color: Color(0xFF9FA2AA),
                  fontSize: 12,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
                    
              SizedBox(
                width: 123,
                child: Text(
                  'Aso-ebi Outfit',
                  style: TextStyle(
                    color: Color(0xFF00182D),
                    fontSize: 14,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
            
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Token',
                style: TextStyle(
                  color: Color(0xFF9FA2AA),
                  fontSize: 12,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              
              Row(
                children: [
                  InkWell(
                    child: showAmount? 
                      const Icon(Icons.visibility_off, size: 16): 
                      const Icon(Icons.visibility, size: 16),
                    onTap: () {
                      setState(() {
                        showAmount =  !showAmount;
                      });
                    },
                  ),
                  const SizedBox(width: 4),

                  showAmount? Text(
                    widget.token,
                    textAlign : TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF00182D),
                      fontSize: 14,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w700,
                    ),
                  ): 
                  const Row(
                    children: [
                      Icon(FontAwesomeIcons.asterisk, size: 14),
                      Icon(FontAwesomeIcons.asterisk, size: 14),
                      Icon(FontAwesomeIcons.asterisk, size: 14),
                      Icon(FontAwesomeIcons.asterisk, size: 14),
                      Icon(FontAwesomeIcons.asterisk, size: 14),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}