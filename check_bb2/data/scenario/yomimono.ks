[cm]
[clearfix]
[start_keyconfig]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]


;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=10]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;メッセージウィンドウの設定
[position layer="message0" left=160 top=5 width=1000 height=200 page=fore visible=true]

#System
IDおよびパスワードは「nojima」です。[p]

[web url="http://beginning.starfree.jp/check_bb/data/BB_yomimono.pdf"]

[cm]
@layopt layer=message0 visible=false
@jump storage="title.ks"
