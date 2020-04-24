<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Modify</title>
    <meta charset="utf-8">
</head>
<body>
    <h1>Modify</h1>
    <form action="modify" method="POST">
        <dd>
            <label for="id">아이디 : </label>
            <input type="text" name="id" id="id" size="10">
        </dd>
        <dd>
            <label for="pw">비밀번호 : </label>
            <input type="password" name="pw" id="pw" size="10">
        </dd>
        <dd>
            <label for="name">이름 : </label>
            <input type="text" name="name" id="name" size="10">
        </dd>
        <dd>
            <label for="phone1">전화번호 : </label>
            <select name="phone1" id="phone1">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="012">012</option>
                <option value="013">013</option>
                <option value="014">014</option>
                <option value="015">015</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select> -
            <input type="text" name="phone2" size="5"> -
            <input type="text" name="phone3" size="5">
        </dd>
        <dd>
            <label for="gender">성별 : </label>
            <input type="radio" name="gender" id="gender" value="male"> 남성
            <input type="radio" name="gender" value="female"> 여성
        </dd>
        <dd>
            <input type="submit" value="회원정보 수정">
            <input type="reset" value="초기화">
        </dd>
    </form>
</body>
</html>