;ティラノスクリプトサンプルゲーム

*start

[cm]
[clearfix]
[start_keyconfig]
[bgmovie storage="loading.webm"]


;[bg storage="room.jpg" time="100"]

;メニューボタンの表示
@showmenubutton

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]


;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=10]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

[iscript]
f.images=["data/fgimage/bb/auhikari_home.jpg","data/fgimage/bb/auhikari_man.jpg","data/fgimage/bb/catv.jpg","data/fgimage/bb/docomohikari_home.jpg","data/fgimage/bb/docomohikari_man.jpg","data/fgimage/bb/kaiyakusinki.png","data/fgimage/bb/niftyhikari_home.jpg","data/fgimage/bb/niftyhikari_man.jpg","data/fgimage/bb/nurohikari_home.jpg","data/fgimage/bb/nurohikari_man.jpg","data/fgimage/bb/sbair.jpg","data/fgimage/bb/sbhikari_home.jpg","data/fgimage/bb/sbhikari_man.jpg","data/fgimage/bb/Unknown.jpg","data/fgimage/bb/yazirusi.png"];
[endscript]

[preload storage=&f.images]

[stop_bgmovie]

;メッセージウィンドウの設定
[position layer="message0" left=160 top=5 width=1000 height=200 page=fore visible=true]

*first
#Question1/3
現在のお住まいを教えてください。[r]

[glink x=500 y=320 text="戸建て" color="blue" target="home"]
[glink x=470 y=400 text="マンション" color="blue" target="apartment"]
[s]

*apartment
[eval exp="f.Housing='apartment'"]
@jump target="second"

*home
[eval exp="f.Housing='home'"]
@jump target="second"

*second
#Question2/3
現在ご利用中のキャリアを教えてください。

[glink x=490 y=240 text="docomo" color="blue" target="docomo"]
[glink x=525 y=320 text="au" color="blue" target="au"]
[glink x=420 y=400 text="SoftBank/Y!mobile" target="SB" color="blue"]
[glink x=500 y=480 text="その他" target="other" color="blue"]
[glink x=500 y=560 text="もどる" target="*return_first" color="blue"]
[s]

*docomo
[eval exp="f.carrier='docomo'"]
@jump target="third"

*au
[eval exp="f.carrier='au'"]
@jump target="third"

*SB
[eval exp="f.carrier='sb'"]
@jump target="third"

*other
[eval exp="f.carrier='other'"]
@jump target="third"

*return_first
[eval exp="f.Housing='unknown'"]
@jump target="first"

*third
#Question3/3
現在ご利用中のご自宅のインターネットを教えてください。[r]
[glink x=475 y=240 text="auひかり" color="blue" target="BB_au"]
[glink x=500 y=320 text="CATV" color="blue" target="BB_CATV"]
[glink x=475 y=400 text="NURO光" target="BB_NURO" color="blue"]
[glink x=500 y=480 text="その他" target="BB_other" color="blue"]
[glink x=500 y=560 text="もどる" target="*return_second" color="blue"]
[s]

*BB_au
[eval exp="f.BB='au'"]
@jump target="result"

*BB_CATV
[eval exp="f.BB='CATV'"]
@jump target="result"

*BB_NURO
[eval exp="f.BB='NURO'"]
@jump target="result"

*BB_other
[eval exp="f.BB='other'"]
@jump target="result"

*return_second
[eval exp="f.carrier='unknown'"]
@jump target="second"

*result
[if exp="f.carrier=='docomo'"]
  [if exp="f.BB=='au'"]
    [if exp="f.Housing=='apartment'"]
*a1001m
*a1011m
      [eval exp="f.code='a1001m'"]
    #Result
      オススメの固定回線は「ドコモ光」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=525 y=320 text="ドコモ光" color="blue" target="amtodm"]
      [glink x=525 y=400 text="NURO光" target="amtonurom" color="blue"]
      [s]

    [else]
*a1001h
      [eval exp="f.code='a1001h'"]
      #Result
      オススメの固定回線は「ドコモ光」です。[r]
        [glink x=525 y=320 text="ドコモ光" color="blue" target="atod"]
        [s]
    [endif]
  [elsif exp="f.BB=='CATV'"]
    [if exp="f.Housing=='apartment'"]
*c2001m
*c2011
    [eval exp="f.code='c2001m'"]
#Result
  オススメの固定回線は「ドコモ光」「NURO光」です。[r]
  ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
  [glink x=525 y=320 text="ドコモ光" color="blue" target="ctod"]
  [glink x=525 y=400 text="nuro光" color="blue" target="ctonm"]
    [s]
    [else]
*c2001
    [eval exp="f.code='c2001'"]
    #Result
      オススメの固定回線は「ドコモ光」です。
      [glink x=525 y=320 text="ドコモ光" color="blue" target="ctod"]
      [s]
[endif]
  [elsif exp="f.BB=='NURO'"]
    [if exp="f.Housing=='apartment'"]
*n3001m
    [eval exp="f.code='n3001m'"]
    #Result
      現状維持がオススメです。[r]
      変更希望である場合のオススメは、「ドコモ光」です。[r]
      [glink x=525 y=320 text="ドコモ光" color="blue" target="nmtodm"]
      [s]
    [else]
*n3001h
      [eval exp="f.code='n3001h'"]
      #Result
      通信速度に不満が無いようであれば現状維持がオススメです。[r]
      料金を抑えたいなど、変更希望である場合のオススメは「ドコモ光」です。[r]
        [glink x=525 y=320 text="ドコモ光" color="blue" target="ntod"]
        [s]
    [endif]

  [else]
    [if exp="f.Housing=='apartment'"]
*o4001m
*o4011m
          [eval exp="f.code='o4001m'"]
    #Result
      オススメの固定回線は「ドコモ光」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=525 y=320 text="ドコモ光" color="blue" target="otodm"]
      [glink x=525 y=400 text="NURO光" target="otonm" color="blue"]
      [s]

    [else]
*o4001h
      [eval exp="f.code='o4001h'"]
      #Result
      オススメの固定回線は「ドコモ光」です。[r]
        [glink x=525 y=320 text="ドコモ光" color="blue" target="otod"]
        [s]
    [endif]
  [endif]

[elsif exp="f.carrier=='au'"]
  [if exp="f.BB=='au'"]
    [if exp="f.Housing=='apartment'"]
*a1002m
*a1012m
    [eval exp="f.code='a1002m'"]
    #Result
      オススメの固定回線は「＠nifty光」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=525 y=320 text="@nifty光" color="blue" target="amtonifm"]
      [glink x=525 y=400 text="NURO光" target="amtonurom2" color="blue"]
      [s]

    [else]
*a1002h
      [eval exp="f.code='a1002h'"]
      #Result
      通信速度に不満が無いようであれば現状維持がオススメです。[r]
      変更希望である場合のオススメは「＠nifty光」です。[r]
        [glink x=525 y=320 text="＠nifty光" color="blue" target="atonif"]
        [s]
    [endif]

  [elsif exp="f.BB=='CATV'"]
    [if exp="f.Housing=='apartment'"]
*c2002m
*c2012m
          [eval exp="f.code='c2002m'"]
    #Result
      オススメの固定回線は「＠nifty光」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=525 y=320 text="@nifty光" color="blue" target="ctonifm"]
      [glink x=525 y=400 text="NURO光" target="ctonm" color="blue"]
      [s]

    [else]
*c2002h
*c2012h
      [eval exp="f.code='c2002h'"]
      #Result
      オススメの固定回線は「＠nifty光」「auひかり」です。[r]
        [glink x=525 y=320 text="＠nifty光" color="blue" target="ctonif"]
        [glink x=525 y=400 text="auひかり" target="ctoa" color="blue"]
        [s]
    [endif]

    [elsif exp="f.BB=='NURO'"]
    [if exp="f.Housing=='apartment'"]
*n3002m
          [eval exp="f.code='n3002m'"]
    #Result
      現状維持がオススメです。[r]
      変更希望である場合のオススメは、「＠nifty光」です。[r]
      [glink x=525 y=320 text="＠nifty光" color="blue" target="nmtonif"]
      [s]

    [else]
*n3002h
*n3012h
      [eval exp="f.code='n3002h'"]
      #Result
      通信速度に不満が無いようであれば現状維持がオススメです。[r]
      オススメの固定回線は「＠nifty光」「auひかり」です。[r]
        [glink x=525 y=320 text="＠nifty光" color="blue" target="ntonif"]
        [glink x=525 y=400 text="auひかり" color="blue" target="ntoau"]
        [s]
    [endif]

  [else]
    [if exp="f.Housing=='apartment'"]
*o4002m
*o4012m
    [eval exp="f.code='o4002m'"]
    #Result
      オススメの固定回線は、「＠nifty光」「NURO光」です。[r]
      [glink x=525 y=320 text="@nifty光" color="blue" target="otonifm"]
      [glink x=525 y=400 text="NURO光" target="otonm" color="blue"]
      [s]

    [else]
*o4002h
*o4012h
      [eval exp="f.code='o4002h'"]
      #Result
      オススメの固定回線は「＠nifty光」「auひかり」です。[r]
        [glink x=525 y=320 text="＠nifty光" color="blue" target="otonif"]
        [glink x=525 y=400 text="auひかり" color="blue" target="otoa"]
        [s]
    [endif]
  [endif]

[elsif exp="f.carrier=='sb'"]
  [if exp="f.BB=='au'"]
    [if exp="f.Housing=='apartment'"]
*a1003m
*a1013m
*a1023m
    [eval exp="f.code='a1003m'"]
    #Result
      オススメの固定回線は「ソフトバンク光」「ソフトバンクAir」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=500 y=320 text="ソフトバンク光" color="blue" target="amtosbm"]
      [glink x=500 y=400 text="ソフトバンクAir" target="amtosba" color="blue"]
      [glink x=530 y=480 text="NURO光" target="amtonurom" color="blue"]
      [s]

    [else]
*a1003h
*a1013h
*a1023h
      [eval exp="f.code='a1003h'"]
      #Result
      オススメの固定回線は「ソフトバンク光」「ソフトバンクAir」「NURO光」です。[r]
      ※Y!mobileご利用中の場合は、オススメから「NURO光」が除外されます。[r]
        [glink x=500 y=320 text="ソフトバンク光" color="blue" target="atosb"]
        [glink x=500 y=400 text="ソフトバンクAir" target="atosba" color="blue"]
        [glink x=470 y=480 text="NURO光（SB限定）" target="atonuro" color="blue"]
        [s]
    [endif]

  [elsif exp="f.BB=='CATV'"]
    [if exp="f.Housing=='apartment'"]

*c2003m
*c2013m
*c2023m
    [eval exp="f.code='c2003m'"]
    #Result
      オススメの固定回線は「ソフトバンク光」「ソフトバンクAir」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=500 y=320 text="ソフトバンク光" color="blue" target="ctosbm"]
      [glink x=500 y=400 text="ソフトバンクAir" target="ctosba" color="blue"]
      [glink x=530 y=480 text="NURO光" target="ctonm" color="blue"]
      [s]

    [else]

*c2003h
*c2013h
*c2023h
      [eval exp="f.code='c2003h'"]
      #Result
      オススメの固定回線は「ソフトバンク光」「ソフトバンクAir」「NURO光」です。[r]
      ※Y!mobileご利用中の場合は、オススメから「NURO光」が除外されます。[r]
      [glink x=500 y=320 text="ソフトバンク光" color="blue" target="ctosb"]
      [glink x=500 y=400 text="ソフトバンクAir" target="ctosba" color="blue"]
      [glink x=470 y=480 text="NURO光（SB限定）" target="ctonuro" color="blue"]
        [s]
    [endif]

    [elsif exp="f.BB=='NURO'"]
    [if exp="f.Housing=='apartment'"]
*n3003m
*n3013m
    [eval exp="f.code='n3003m'"]
    #Result
      現状維持がオススメです。[r]
      変更希望である場合のオススメは、「ソフトバンク光」「ソフトバンクAir」です。[r]
      [glink x=500 y=320 text="ソフトバンク光" color="blue" target="nmtosb"]
      [glink x=500 y=400 text="ソフトバンクAir" target="nmtosba" color="blue"]
      [s]

    [else]
*n3003h
*n3013h
      [eval exp="f.code='n3003h'"]
      #Result
      通信速度に不満が無いようであれば現状維持がオススメです。[r]
      料金を抑えたいなど、変更希望である場合のオススメは「ソフトバンク光」「ソフトバンクAir」です。[r]
        [glink x=500 y=320 text="ソフトバンク光" color="blue" target="ntosb"]
        [glink x=500 y=400 text="ソフトバンクAir" target="ntosba" color="blue"]
        [s]
    [endif]

  [else]
    [if exp="f.Housing=='apartment'"]
*o4003m
*o4013m
*o4023m
    [eval exp="f.code='o4003m'"]
    #Result
      オススメの固定回線は、「ソフトバンク光」「ソフトバンクAir」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=500 y=320 text="ソフトバンク光" color="blue" target="otosbm"]
      [glink x=500 y=400 text="ソフトバンクAir" target="otosba" color="blue"]
      [glink x=530 y=480 text="NURO光" target="otonm" color="blue"]
      [s]

    [else]
*o4003h
*o4013h
*o4023h
      [eval exp="f.code='o4003h'"]
      #Result
      オススメの固定回線は「ソフトバンク光」「ソフトバンクAir」「NURO光」です。[r]
      ※Y!mobileご利用中の場合は、オススメから「NURO光」が除外されます。[r]
      [glink x=500 y=320 text="ソフトバンク光" color="blue" target="otosb"]
      [glink x=500 y=400 text="ソフトバンクAir" target="otosba" color="blue"]
      [glink x=470 y=480 text="NURO光（SB限定）" target="otonuro" color="blue"]
        [s]
    [endif]
  [endif]

[elsif exp="f.carrier=='other'"]
  [if exp="f.BB=='au'"]
    [if exp="f.Housing=='apartment'"]
*a1004m
*a1014m
    [eval exp="f.code='a1004m'"]
    #Result
      オススメの固定回線は「＠nifty光」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=525 y=320 text="＠nifty光" color="blue" target="amtonifm"]
      [glink x=525 y=400 text="NURO光" target="amtonurom" color="blue"]
      [s]

    [else]
*a1004h
*a1014h
      [eval exp="f.code='a1004h'"]
      #Result
      通信速度に不満が無いようであれば現状維持がオススメです。[r]
      変更希望である場合のオススメは「＠nifty光」「NURO光」です。[r]
        [glink x=525 y=320 text="＠nifty光" color="blue" target="atonif"]
        [glink x=525 y=400 text="NURO光" color="blue" target="atonuro"]
        [s]
    [endif]

  [elsif exp="f.BB=='CATV'"]
    [if exp="f.Housing=='apartment'"]
*c2004m
*c2014m
    [eval exp="f.code='c2004m'"]
    #Result
      オススメの固定回線は「＠nifty光」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=525 y=320 text="＠nifty光" color="blue" target="ctonifm"]
      [glink x=525 y=400 text="NURO光" target="ctonm" color="blue"]
      [s]

    [else]
*c2004h
*c2014h
*c2024h
      [eval exp="f.code='c2004h'"]
      #Result
      オススメの固定回線は「＠nifty光」「NURO光」「auひかり」です。[r]
        [glink x=525 y=320 text="＠nifty光" color="blue" target="ctonif"]
        [glink x=525 y=400 text="NURO光" color="blue" target="ctonuro"]
        [glink x=525 y=480 text="auひかり" target="ctoa" color="blue"]
        [s]
    [endif]

    [elsif exp="f.BB=='NURO'"]
    [if exp="f.Housing=='apartment'"]
*n3004m
    [eval exp="f.code='n3004m'"]
    #Result
      現状維持がオススメです。[r]
      変更希望である場合のオススメは、「＠nifty光」です。[r]
      [glink x=525 y=320 text="＠nifty光" color="blue" target="nmtonif"]
      [s]

    [else]
*n3004h
*n3014h
      [eval exp="f.code='n3004h'"]
      #Result
      通信速度に不満が無いようであれば現状維持がオススメです。[r]
      変更希望である場合のオススメは「＠nifty光」「auひかり」です。[r]
      [glink x=525 y=320 text="＠nifty光" color="blue" target="ntonif"]
      [glink x=525 y=400 text="auひかり" color="blue" target="ntoau"]
        [s]
    [endif]

  [else]
    [if exp="f.Housing=='apartment'"]
*o4004m
*o4014m
    [eval exp="f.code='o4004m'"]
    #Result
      オススメの固定回線は「＠nifty光」「NURO光」です。[r]
      ※NURO光は提供エリアが少数のため、導入の保証はできません。[r]
      [glink x=525 y=320 text="＠nifty光" color="blue" target="otonifm"]
      [glink x=525 y=400 text="NURO光" target="otonm" color="blue"]
      [s]

    [else]
*o4004h
*o4014h
*o4024h
      [eval exp="f.code='o4004h'"]
      #Result
      オススメの固定回線は「＠nifty光」「NURO光」「auひかり」です。[r]
        [glink x=525 y=320 text="＠nifty光" color="blue" target="otonif"]
        [glink x=525 y=400 text="NURO光" color="blue" target="otonuro"]
        [glink x=525 y=480 text="auひかり" color="blue" target="otoa"]
        [s]
    [endif]
  [endif]
[else]
#System
不明なエラーが発生しました。[p]
@jump storage="title.ks"
[endif]

*amtodm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1001m"]

*amtonurom
[if exp="f.code=='a1003m'"]
[eval exp="f.code='a1023m'"]
[elsif exp="f.code=='a1004m'"]
[eval exp="f.code='a1014m'"]
[elsif exp="f.code=='a1001m'"]
[eval exp="f.code='a1011m'"]
[endif]


[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1011m"]

*amtonurom2
[eval exp="f.code='a1012m'"]
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1012m"]

*atod
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1001h"]

*ctod
[cm]
[hidemenubutton]

[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]
[if exp="f.Housing=='apartment'"]
  [eval exp="f.code='c2011'"]
  [jump storage="result.ks" target="c2011"]
[else]
  [jump storage="result.ks" target="c2001"]
[endif]

*nmtodm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3001m"]

*ntod
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3001h"]

*otodm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4001m"]

*otonm
[if exp="f.code=='o4002m'"]
[eval exp="f.code='o4012m'"]
[elsif exp="f.code=='o4003m'"]
[eval exp="f.code='o4023m'"]
[elsif exp="f.code=='o4001m'"]
[eval exp="f.code='o4011m'"]
[elsif exp="f.code=='o4004m'"]
[eval exp="f.code='o4014m'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4011m"]

*otod
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4001h"]

*amtonifm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1002m"]

*atonif
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1002h"]

*ctonm
[if exp="f.code=='c2002m'"]
  [eval exp="f.code='c2012m'"]
[elsif exp="f.code=='c2003m'"]
  [eval exp="f.code='c2023m'"]
[elsif exp="f.code=='c2004m'"]
  [eval exp="f.code='c2014m'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="c2012m"]

*ctonifm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="c2002m"]

*ctonif
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="c2002h"]

*ctoa
[if exp="f.code=='c2004h'"]
  [eval exp="f.code='c2024h'"]
[elsif exp="f.code=='c2002h'"]
  [eval exp="f.code='c2012h'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="c2012h"]

*nmtonif
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3002m"]

*ntonif
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3002h"]

*ntoau
[if exp="f.code=='n3004h'"]
  [eval exp="f.code='*n3014h'"]
[elsif exp="f.code=='n3002h'"]
  [eval exp="f.code='n3012h'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3012h"]

*otonifm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4002m"]

*otonif
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4002h"]

*otoa
[if exp="f.code=='o4004h'"]
  [eval exp="f.code='o4024h'"]
[elsif exp="f.code=='o4002h'"]
  [eval exp="f.code='o4012h'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4012h"]

*amtosbm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1003m"]

*amtosba
[if exp="f.code=='a1003m'"]
  [eval exp="f.code='a1013m'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1013m"]

*atonuro
[if exp="f.code=='a1004h'"]
  [eval exp="f.code='*a1014h'"]
[elsif exp="f.code=='a1003h'"]
  [eval exp="f.code='a1023h'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1023h"]

*atosba
[if exp="f.code=='a1003h'"]
  [eval exp="f.code='a1013h'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1013h"]

*atosb
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="a1003h"]

*ctosbm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="c2003m"]

*ctosba
[if exp="f.code=='c2003h'"]
  [eval exp="f.code='c2013h'"]
[elsif exp="f.code=='c2003m'"]
  [eval exp="f.code='c2013m'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="c2013m"]

*ctosb
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="c2003h"]

*ctonuro
[if exp="f.code=='c2004h'"]
  [eval exp="f.code='c2014h'"]
[elsif exp="f.code=='c2003h'"]
  [eval exp="f.code='c2023h'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="c2023h"]

*nmtosb
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3003m"]

*nmtosba
[if exp="f.code=='n3003m'"]
 [eval exp="f.code='n3013m'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3013m"]

*ntosb
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3003h"]

*ntosba
[if exp="f.code=='n3003h'"]
  [eval exp="f.code='n3013h'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="n3013h"]

*otosbm
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4003m"]

*otosba
[if exp="f.code=='o4003h'"]
[eval exp="f.code='o4013h'"]
[elsif exp="f.code=='o4003m'"]
  [eval exp="f.code='o4013m'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4013m"]

*otosb
[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4003h"]

*otonuro
[if exp="f.code=='o4004h'"]
  [eval exp="f.code='*o4014h'"]
[elsif exp="f.code=='o4003h'"]
  [eval exp="f.code='o4023h'"]
[endif]

[cm]
[hidemenubutton]
[layopt layer="message0" visible="false"]
[bgmovie storage="loading.webm"]

[jump storage="result.ks" target="o4023h"]


[s]
