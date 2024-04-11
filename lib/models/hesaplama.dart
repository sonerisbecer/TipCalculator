class Hesaplama
{
  int bahsis = 0;
  int yuzde = 0;
  int bolen = 0;

  Hesaplama(int bahsis, int yuzde, int bolen)
  {
    this.bahsis = bahsis;
    this.yuzde = yuzde;
    this.bolen = bolen;

  }

  hesapla()
  {
    return  (this.bahsis * this.yuzde)/100 + this.bolen ;
  }
}