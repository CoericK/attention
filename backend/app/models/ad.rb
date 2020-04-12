class Ad < ApplicationRecord
  def banner
    [
      'https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/qt1pq58r827iyyvugjfr.jpg',
      'https://createsyou.com/wp-content/uploads/2019/03/Burger-King-BURN-THAT-AD-createsyou.png'
    ].sample
  end
end
