import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_emoji/burger_page.dart';
import 'package:food_emoji/foodtabs.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.white),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 3.0)
                        ),
                      ],
                      color: Color(0xffc6e7fe),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/tuxedo.png'),
                        fit: BoxFit.contain,
                      )
                    ),
                  )
                ],
              ),
          ),
          Padding(padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'SEARCH FOR',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 27.0,
                color: Colors.white,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'FOODS',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 27.0,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.notoSans(
                    fontSize: 14.0,
                    color: Colors.white
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: Icon(Icons.search_outlined, color: Colors.grey,)
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Recommended',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 15.0,),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('Hamburg', 'assets/hamburger.png', '21', Color(0xffFFEAC5), Color(0xffE1A25A),),
                _buildListItem('Fries', 'assets/french-fries.png', '15', Color(0xffc2e3fe), Color(0xff6a8caa),),
                _buildListItem('Donut', 'assets/donut.png', '15', Color(0xffd7fada), Color(0xff56cc7e),),
                _buildListItem('CupCake', 'assets/cupcake.png', '8', Color(0xffa3d2ca), Color(0xff5eaaa8),),
                _buildListItem('Taco', 'assets/taco.png', '12', Color(0xffa685e2), Color(0xff6155a6),),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                fontSize: 16.0,
                fontWeight: FontWeight.w700
              ),
              unselectedLabelStyle: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500,
                fontSize: 12.0
              ),
              tabs: [
                Tab(child: Text('FEATURED', style: TextStyle(
                  color: Colors.white
                ),),),
                Tab(child: Text('COMBO', style: TextStyle(
                  color: Colors.white
                ),),),
                Tab(child: Text('FAVORITES', style: TextStyle(
                  color: Colors.white
                ),),),
                Tab(child: Text('RECOMMENDED', style: TextStyle(
                  color: Colors.white
                ),),),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor, Color textColor){
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(heroTag: foodName, foodName: foodName, pricePerItem: price, imgPath: imgPath,)
          ));
        },
        child: Container(
          height: 17.0,
          width: 150.0,
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15.0),
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: foodName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Image.asset(imgPath, width: 45.0,),
                  ),
                )
              ),
              SizedBox(height: 25.0,),
              Text(
                foodName,
                style: GoogleFonts.notoSans(
                  fontSize: 17.0,
                  color: textColor
                ),
              ),
              Text('\$'+ price,
                style: GoogleFonts.notoSans(
                    fontSize: 17.0,
                    color: textColor
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// https://dribbble.com/shots/9094050-Online-Reservation/attachments/1177787?mode=media
