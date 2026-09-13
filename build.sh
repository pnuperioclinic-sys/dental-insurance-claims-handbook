#!/bin/sh
# handbook.html (Artifact 소스 조각) -> index.html (GitHub Pages 배포용 독립 문서)
# 수정은 handbook.html 에만 하고, 이 스크립트를 실행해 index.html 을 다시 생성합니다.
set -e
cd "$(dirname "$0")"
{
  printf '%s\n' '<!doctype html>'
  printf '%s\n' '<html lang="ko">'
  printf '%s\n' '<head>'
  printf '%s\n' '<meta charset="utf-8">'
  printf '%s\n' '<meta name="viewport" content="width=device-width, initial-scale=1">'
  printf '%s\n' '<meta name="description" content="치과 직원 교육용 건강보험청구 실무 핸드북 - 급여기준, 덴트웹 실무 적용, 삭감 방지 체크리스트">'
  printf '%s\n' '<style>:root{color-scheme:light dark}html,body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  cat handbook.html
  printf '%s\n' '</body>'
  printf '%s\n' '</html>'
} > index.html
echo "index.html 생성 완료"
