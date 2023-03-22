<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c-rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt-rt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
    <title>Login</title>
    <style>
    
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&family=Noto+Serif+JP:wght@200&display=swap');
    	body, html {
    height: 80%;
    background-repeat: no-repeat;
    background-image: url(https://img.poipiku.com/user_img02/002382369/008490249_AHMaygEEr.png_640.jpg);
	background-size : cover;
	opacity : 1.0;
}

.card-container.card {

	width:1200px; height:800px;
    padding: 40px 40px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
 .card {
    background-color: #F7F7F795;
    /* just in case there no content*/
    width: 80%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    /* shadows and rounded borders */
    -webkit-border-top-right-radius: 24px;
	-webkit-border-top-left-radius: 24px;
	-webkit-border-bottom-right-radius : 24px;
	-webkit-border-bottom-left-radius : 24px;

}


.profile-img-card {
    width : 200px;
    height : 200px;
    margin : 0 auto 10px;
    display : block;
    -moz-border-radius : 50%;
    -webkit-border-radius : 50%;
    border-radius : 60%;
    top : 150px;
    position : relative;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin #inputEmail,
.form-signin #inputPassword {
    direction: ltr;
    height: 44px;
    font-size: 16px;
}

.form-signin input[type=email],
.form-signin input[type=password],
.form-signin button 
{
    width: 80%;
    height : 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    top: 130px;
    left : 100px;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font-family: 'Nanum Gothic Coding', monospace;
    radius : 12px;
    
}

.form-signin button {
	width: 40%;
	height : 100%;
    display: block;
    margin-bottom : 10px;
    z-index: 1;
    position: relative;
    top: 150px;
    left : 550px;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font-family: 'Nanum Gothic Coding', monospace;
    radius : 12px;
    
}

.form-signin .form-control:focus {
    border-color: rgb(104, 145, 162);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}

.btn.btn-signin {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 46px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 12px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transion: all 0.218s;
    transition: all 0.218s;
}

.form-control {
	width: 80%;
	height : 46px;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
}

.forgot-password {
    color: rgb(104, 145, 162);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
}
	
    </style>
</head>
<body>
        <div class="container">
        <div class="card card-container" style = "text-align : center";>
            <!-- <img class="profile-img-card" src="https://img-org.poipiku.com/user_img02/002382369/008490217_rNpC97Iyn.png" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png">
            <p id="profile-name" class="profile-name-card"></p>

            
            
            <form class="form-signin" action="/members/login"  method="POST" >

            <form class="form-signin">

                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="inputEmail" class="form-control" placeholder="   아이디" required autofocus>
                <input type="password" id="inputPassword" class="form-control" placeholder="   비밀번호" required>

                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">로그인</button>
            </form><!-- /form -->
            <a href="#" class="go-to-signin">
                회원이 아니신가요?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->
       
    <script>
    $( document ).ready(function() {
        // DOM ready

        // Test data
        /*
         * To test the script you should discomment the function
         * testLocalStorageData and refresh the page. The function
         * will load some test data and the loadProfile
         * will do the changes in the UI
         */
        // testLocalStorageData();
        // Load profile if it exits
        loadProfile();
    });

    /**
     * Function that gets the data of the profile in case
     * thar it has already saved in localstorage. Only the
     * UI will be update in case that all data is available
     *
     * A not existing key in localstorage return null
     *
     */
    function getLocalProfile(callback){
        var profileImgSrc      = localStorage.getItem("PROFILE_IMG_SRC");
        var profileName        = localStorage.getItem("PROFILE_NAME");
        var profileReAuthEmail = localStorage.getItem("PROFILE_REAUTH_EMAIL");

        if(profileName !== null
                && profileReAuthEmail !== null
                && profileImgSrc !== null) {
            callback(profileImgSrc, profileName, profileReAuthEmail);
        }
    }

    /**
     * Main function that load the profile if exists
     * in localstorage
     */
    function loadProfile() {
        if(!supportsHTML5Storage()) { return false; }
        // we have to provide to the callback the basic
        // information to set the profile
        getLocalProfile(function(profileImgSrc, profileName, profileReAuthEmail) {
            //changes in the UI
            $("#profile-img").attr("src",profileImgSrc);
            $("#profile-name").html(profileName);
            $("#reauth-email").html(profileReAuthEmail);
            $("#inputEmail").hide();
            $("#remember").hide();
        });
    }

    /**
     * function that checks if the browser supports HTML5
     * local storage
     *
     * @returns {boolean}
     */
    function supportsHTML5Storage() {
        try {
            return 'localStorage' in window && window['localStorage'] !== null;
        } catch (e) {
            return false;
        }
    }

    /**
     * Test data. This data will be safe by the web app
     * in the first successful login of a auth user.
     * To Test the scripts, delete the localstorage data
     * and comment this call.
     *
     * @returns {boolean}
     */
    function testLocalStorageData() {
        if(!supportsHTML5Storage()) { return false; }
        localStorage.setItem("PROFILE_IMG_SRC", "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" );
        localStorage.setItem("PROFILE_NAME", "César Izquierdo Tello");
        localStorage.setItem("PROFILE_REAUTH_EMAIL", "oneaccount@gmail.com");
    }
    </script>    
</body>
</html>