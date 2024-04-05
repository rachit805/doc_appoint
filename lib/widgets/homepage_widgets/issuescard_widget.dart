import 'package:Doctor/data/issueCard_data.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class IssuesCardWidget extends StatelessWidget {
  const IssuesCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: issueCardData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromRGBO(245, 245, 245, 0.83),
                      width: 1),
                  color: const Color.fromRGBO(252, 252, 255, 1)),
              height: 140,
              width: 250,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(18, 154, 127, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      height: 25,
                      width: 50,
                      child: Center(
                        child: Text(
                          "\$${issueCardData[i].price}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              issueCardData[i].title,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(116, 94, 152, 1),
                                // color: Color.fromARGB(1, 116, 94, 152),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                                width: 10,
                                child: VerticalDivider(
                                  color: Colors.black,
                                )),
                            Flexible(
                              child: Text(
                                issueCardData[i].description,
                                textAlign: TextAlign.left,
                                maxLines: 5,
                                style: const TextStyle(
                                  color: Color.fromRGBO(171, 172, 187, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
