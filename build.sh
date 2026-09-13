#!/bin/sh
# Artifact 소스 조각(*.html) -> GitHub Pages 배포용 독립 문서
# 수정은 소스 조각에만 하고, 이 스크립트를 실행해 배포본을 다시 생성합니다.
set -e
cd "$(dirname "$0")"

build() {
  src="$1"
  out="$2"
  desc="$3"
  {
    printf '%s\n' '<!doctype html>'
    printf '%s\n' '<html lang="ko">'
    printf '%s\n' '<head>'
    printf '%s\n' '<meta charset="utf-8">'
    printf '%s\n' '<meta name="viewport" content="width=device-width, initial-scale=1">'
    printf '%s\n' "<meta name=\"description\" content=\"$desc\">"
    printf '%s\n' '<style>:root{color-scheme:light dark}html,body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
    cat "$src"
    printf '%s\n' '</body>'
    printf '%s\n' '</html>'
  } > "$out"
  echo "$out 생성 완료"
}

build handbook.html index.html \
  '치과 직원 교육용 건강보험청구 실무 핸드북 - 급여기준, 덴트웹 실무 적용, 삭감 방지 체크리스트'

build planning-note.html planning.html \
  '압도적 1등을 만드는 병원 기획의 정석 - 치과 직원용 요약 노트. 브랜딩, 신환 유입, 방문 경험, 조직, 성과 관리'
