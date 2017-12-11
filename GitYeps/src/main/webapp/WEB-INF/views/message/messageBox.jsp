<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>CSS Tip | Checkbox Border Color</title>
    <style>
      input[id="cb2"] + label {
        display: inline-block;
        width: 14px;
        height: 14px;
        background-color: #bcbcbc;
        border-radius: 7px;
        cursor: pointer;
      }
      input[id="cb2"]:checked + label {
        background-color: blue;
      }
      input[id="cb2"] {
        display: none;
      }
    </style>
  </head>
  <body>
    <h3>Circle Checkbox</h3>
    <input type="checkbox" id="cb2">
    <label for="cb2"></label>
  </body>
</html>