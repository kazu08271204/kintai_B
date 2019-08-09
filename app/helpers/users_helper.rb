module UsersHelper
  
  # 勤怠基本情報を指定のフォーマットで返します。
  
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60.0)
    #戻り値となる文字列書式を設定しフォーマットするための値を計算している。
  end
  
end

