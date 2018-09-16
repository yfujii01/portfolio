class Item < ApplicationRecord
  validates :title, presence: true

  # 詳細をHTML表示用に返却する
  # DBに登録されたタグは無効化し
  # 改行はbrタグに変換
  def getDetailTextView
    ERB::Util.html_escape(detail).gsub(/(\n|\r\n)/,"<br />").html_safe
  end
end
