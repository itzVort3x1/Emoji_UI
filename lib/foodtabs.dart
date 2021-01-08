import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          _buildListItem('Delicious hot dog', 4.0, '6', 'assets/hotdog.png'),
          _buildListItem('Cheese Pizza', 5.0, '12', 'assets/pizza.png'),
          _buildListItem('Spicy Ramen', 5.0, '12', 'assets/ramen.png'),
          _buildListItem('Tuna Sushi', 5.0, '12', 'assets/sushi.png')
        ],
      ),
    );
  }
  _buildListItem(String foodName, rating, String price, String imgpath){
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210.0,
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xffffe3df)
                  ),
                  child: Center(
                    child: Image.asset(imgpath, height: 50.0, width: 50.0,),
                  ),
                ),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: GoogleFonts.notoSans(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      // onRatingChanged: () {},
                      starCount: rating.toInt(),
                      rating: rating,
                      color: Color(0xffffd143),
                      borderColor: Color(0xffffd143),
                      size: 15.0,
                      spacing: 0.0
                    ),
                    Row(
                      children: [
                        Text('\$'+ price,
                          style: GoogleFonts.lato(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                color: Colors.white
                              ),
                          ),
                        ),
                        SizedBox(width: 3.0,),
                        Text('\$'+ '18',
                          style: GoogleFonts.lato(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            onPressed: () {},
            child: Center(
              child: Icon(Icons.add, color: Colors.white),
            ),
            backgroundColor: Color(0xfffe7d6a),
          ),
        ],
      ),
    );
  }
}
