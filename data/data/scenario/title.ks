
[cm]

@clearstack
@wait time = 200


*start
[glink  x=500 y=320 color="blue"  text="BB判定ツール" target="bbstart"]

[glink x=500 y=460 color="blue" text="BBのよみもの" target="yomimono"]
[s]

*bbstart
;一番最初のシナリオファイルへジャンプする
@jump storage="scene1.ks"

*yomimono
@jump storage="yomimono.ks"

*mobilestart
