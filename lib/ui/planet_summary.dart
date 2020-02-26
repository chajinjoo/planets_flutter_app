import 'package:flutter/material.dart';
import 'package:planets_flutter_app/common/text_style.dart';
import 'package:planets_flutter_app/model/planets.dart';
import 'package:planets_flutter_app/ui/detail/datail_page.dart';
import 'package:planets_flutter_app/common/separator.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;

  final bool horizontal;

  PlanetSummary(this.planet, {this.horizontal = true});

  PlanetSummary.vertical(this.planet) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: 'planet-hero-${planet.id}',
        child: Image(
          image: AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _planetValue({String value, String image}) {
      return Container(
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Image.asset(image, height: 12.0),
          Container(width: 8.0),
          Text(planet.gravity, style: Style.smallTextStyle),
        ]),
      );
    }

    final planetCardContent = Container(
      //전체 컨텐츠의 기본 위젯이 될 컨테이너
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(), //크기의 제약을 줌
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0), //빈 컨테이너 사용으로 텍스트 요소 구분
          Text(
            planet.name,
            style: Style.titleTextStyle,
          ),
          Container(height: 10.0),
          Text(planet.location, style: Style.commonTextStyle),
          Separator(),

          Row(
            //거리와 중력은 가로로 배정
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.distance,
                      image: 'assets/img/ic_distance.png')),
              Container(
                width: 32.0,
              ),
              Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                    value: planet.gravity, image: 'assets/img/ic_gravity.png'),
              ),
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin:
          horizontal ? EdgeInsets.only(left: 30.0) : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
          color: Color(0xFF333366), //컨테이너 배경색
          shape: BoxShape.rectangle, //직사각형 모양
          borderRadius: BorderRadius.circular(8.0), //테두리선
          boxShadow: <BoxShadow>[
            BoxShadow(
              //그림자효과
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ]),
    );

    return GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new DetailPage(planet),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          //상자의 가장자리를 기준으로 자식을 배치하는 위젯. 여러 자식 요소를 겹칠 수 있음
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }
}
