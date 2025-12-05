void main(){
  int x = 20;
  int? y;
  int z = x + (y ?? 0);
  print("Hello $y");

  int? maybeNumber;
  maybeNumber = 10;

  int number = maybeNumber!;
  print(number);


  int? maybeNumber2;
  maybeNumber2 ?? 0;
  print(maybeNumber2);

}