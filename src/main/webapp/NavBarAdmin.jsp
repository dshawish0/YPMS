<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/31/2022
  Time: 2:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<style>


</style>


<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />
    <title>YPMS</title>

    <script>
        window.addEventListener("load", function(){

            // Remove Loader
            var load_screen = document.getElementById("load_screen");
            document.body.removeChild(load_screen);

            var layoutName = 'Vertical Light Menu';

            var settingsObject = {
                admin: 'Cork Admin Template',
                settings: {
                    layout: {
                        name: layoutName,
                        toggle: true,
                        darkMode: false,
                        boxed: false,
                        logo: {
                            darkLogo: '../src/assets/img/logo.svg',
                            lightLogo: '../src/assets/img/logo.svg'
                        }
                    }
                },
                reset: false
            }


            if (settingsObject.reset) {
                localStorage.clear()
            }

            if (localStorage.length === 0) {
                corkThemeObject = settingsObject;
            } else {

                getcorkThemeObject = localStorage.getItem("theme");
                getParseObject = JSON.parse(getcorkThemeObject)
                ParsedObject = getParseObject;

                if (getcorkThemeObject !== null) {

                    if (ParsedObject.admin === 'Cork Admin Template') {

                        if (ParsedObject.settings.layout.name === layoutName) {

                            corkThemeObject = ParsedObject;
                        } else {
                            corkThemeObject = settingsObject;
                        }

                    } else {
                        if (ParsedObject.admin === undefined) {
                            corkThemeObject = settingsObject;
                        }
                    }

                }  else {
                    corkThemeObject = settingsObject;
                }
            }

            // Get Dark Mode Information i.e darkMode: true or false

            if (corkThemeObject.settings.layout.darkMode) {
                localStorage.setItem("theme", JSON.stringify(corkThemeObject));
                getcorkThemeObject = localStorage.getItem("theme");
                getParseObject = JSON.parse(getcorkThemeObject)

                if (getParseObject.settings.layout.darkMode) {
                    ifStarterKit = document.body.getAttribute('page') === 'starter-pack' ? true : false;
                    document.body.classList.add('dark');
                    if (ifStarterKit) {
                        if (document.querySelector('.navbar-logo')) {
                            document.querySelector('.navbar-logo').setAttribute('src', '../../src/assets/img/logo.svg')
                        }
                    } else {
                        if (document.querySelector('.navbar-logo')) {
                            document.querySelector('.navbar-logo').setAttribute('src', getParseObject.settings.layout.logo.darkLogo)
                        }
                    }
                }
            } else {
                localStorage.setItem("theme", JSON.stringify(corkThemeObject));
                getcorkThemeObject = localStorage.getItem("theme");
                getParseObject = JSON.parse(getcorkThemeObject)

                if (!getParseObject.settings.layout.darkMode) {
                    ifStarterKit = document.body.getAttribute('page') === 'starter-pack' ? true : false;
                    document.body.classList.remove('dark');
                    if (ifStarterKit) {
                        if (document.querySelector('.navbar-logo')) {
                            document.querySelector('.navbar-logo').setAttribute('src', '../../src/assets/img/logo2.svg')
                        }
                    } else {
                        if (document.querySelector('.navbar-logo')) {
                            document.querySelector('.navbar-logo').setAttribute('src', getParseObject.settings.layout.logo.lightLogo)
                        }
                    }

                }
            }

            // Get Layout Information i.e boxed: true or false

            if (corkThemeObject.settings.layout.boxed) {

                localStorage.setItem("theme", JSON.stringify(corkThemeObject));
                getcorkThemeObject = localStorage.getItem("theme");
                getParseObject = JSON.parse(getcorkThemeObject)

                if (getParseObject.settings.layout.boxed) {

                    if (document.body.getAttribute('layout') !== 'full-width') {
                        document.body.classList.add('layout-boxed');
                        if (document.querySelector('.header-container')) {
                            // document.querySelector('.header-container').classList.add('container-xxl');
                        }
                        if (document.querySelector('.middle-content')) {
                            document.querySelector('.middle-content').classList.add('container-xxl');
                        }
                    } else {
                        document.body.classList.remove('layout-boxed');
                        if (document.querySelector('.header-container')) {
                            document.querySelector('.header-container').classList.remove('container-xxl');
                        }
                        if (document.querySelector('.middle-content')) {
                            document.querySelector('.middle-content').classList.remove('container-xxl');
                        }
                    }

                }

            } else {

                localStorage.setItem("theme", JSON.stringify(corkThemeObject));
                getcorkThemeObject = localStorage.getItem("theme");
                getParseObject = JSON.parse(getcorkThemeObject)

                if (!getParseObject.settings.layout.boxed) {

                    if (document.body.getAttribute('layout') !== 'boxed') {
                        document.body.classList.remove('layout-boxed');
                        if (document.querySelector('.header-container')) {
                            document.querySelector('.header-container').classList.remove('container-xxl');
                        }
                        if (document.querySelector('.middle-content')) {
                            document.querySelector('.middle-content').classList.remove('container-xxl');
                        }
                    } else {
                        document.body.classList.add('layout-boxed');
                        if (document.querySelector('.header-container')) {
                            // document.querySelector('.header-container').classList.add('container-xxl');
                        }
                        if (document.querySelector('.middle-content')) {
                            document.querySelector('.middle-content').classList.add('container-xxl');
                        }
                    }
                }
            }





        });



    </script>

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet" />

    <style>
        /*
	===============================
			@Import	Function
	===============================
*/


        /*
      ===============================
              @Import	Mixins
      ===============================
  */

        html {
            min-height: 100%;
            direction: ltr;
        }

        body {
            color: #888ea8;
            height: 100%;
            font-size: 0.875rem;
            background: #f1f2f3;
            overflow-y: auto;
            letter-spacing: 0.0312rem;
            font-family: "Nunito", sans-serif;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            color: #3b3f5c;
        }

        :focus {
            outline: none;
        }

        p {
            margin-top: 0;
            margin-bottom: 0.625rem;
            color: #515365;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border-top: 1px solid #515365;
        }

        strong {
            font-weight: 600;
        }

        code {
            color: #e7515a;
        }


        /*Page title*/

        .page-header {
            border: 0;
            margin: 0;
        }

        .page-header:before {
            display: table;
            content: "";
            line-height: 0;
        }

        .page-header:after {
            display: table;
            content: "";
            line-height: 0;
            clear: both;
        }

        .page-title h3 {
            margin: 0;
            margin-bottom: 0;
            font-size: 20px;
            color: #e0e6ed;
            font-weight: 600;
        }

        .page-title span {
            display: block;
            font-size: 11px;
            color: #555555;
            font-weight: normal;
        }

        .main-container {
            min-height: 100vh;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -ms-flex-direction: row;
            flex-direction: row;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            -webkit-box-pack: start;
            -ms-flex-pack: start;
            justify-content: flex-start;
            padding: 0 0 0 16px;
        }

        #container.fixed-header {
            margin-top: 56px;
        }

        #content {
            width: 50%;
            flex-grow: 8;
            margin-top: 130px;
            margin-bottom: 0;
            margin-left: 300px;
        }

        /*.main-container-fluid>.main-content>.container {*/
        /*  float: left;*/
        /*  width: 100%;*/
        /*}*/

        #content>.wrapper {
            -webkit-transition: margin ease-in-out 0.1s;
            -moz-transition: margin ease-in-out 0.1s;
            -o-transition: margin ease-in-out 0.1s;
            transition: margin ease-in-out 0.1s;
            position: relative;
        }

        .widget {
            padding: 0;
            margin-top: 0;
            margin-bottom: 0;
            box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
        }

        .layout-top-spacing {
            margin-top: 20px;
        }

        .layout-spacing {
            padding-bottom: 24px;
        }

        .layout-px-spacing {
            padding: 0 24px !important;
            width: 150%;
        }

        .widget.box .widget-header {
            background: #fff;
            padding: 0px 8px 0px;
            border-top-right-radius: 8px;
            border-top-left-radius: 8px;
            border: 1px solid #e0e6ed;
            border-bottom: none;
        }

        .row [class*=col-] .widget .widget-header h4 {
            color: #3b3f5c;
            font-size: 17px;
            font-weight: 600;
            margin: 0;
            padding: 16px 15px;
        }

        .seperator-header {
            background: transparent;
            box-shadow: none;
            margin-bottom: 40px;
            border-radius: 0;
        }

        .seperator-header h4 {
            margin-bottom: 0;
            line-height: 1.4;
            padding: 5px 8px;
            font-size: 15px;
            border-radius: 4px;
            letter-spacing: 1px;
            display: inline-block;
            background: rgba(0, 150, 136, 0.26);
            color: #009688;
            font-weight: 500;
        }

        .widget .widget-header {
            border-bottom: 0px solid #f1f2f3;
        }

        .widget .widget-header:before {
            display: table;
            content: "";
            line-height: 0;
        }

        .widget .widget-header:after {
            display: table;
            content: "";
            line-height: 0;
            clear: both;
        }

        .widget-content-area {
            padding: 20px;
            position: relative;
            background-color: #fff;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            border: 1px solid #e0e6ed;
            border-top: none;
        }

        .content-area {
            max-width: 58.333333%;
            margin-left: 80px;
        }


        /*
  =====================
      Navigation Bar
  =====================
  */

        .header-container {
            background: #DC143C;
            z-index: 1032;
            position: fixed;
            top: 0;
            padding: 4px 20px 4px 16px;
            width: 100%;
        }

        .header-container.container-xxl {
            left: 255px;
        }

        .header-container .theme-brand {
            display: -ms-flexbox;
            display: flex;
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
            padding: 0.9px 0 0.9px 12px;
            justify-content: space-between;
        }

        .header-container .theme-brand .theme-logo a img {
            width: 34px;
            height: 34px;
        }

        .header-container .theme-text {
            margin-right: 32px;
        }

        .header-container .theme-text a {
            font-size: 24px;
            color: #e0e6ed;
            line-height: 2.75rem;
            padding: 0 0.8rem;
            text-transform: initial;
            position: unset;
            font-weight: 700;
        }

        .navbar {
            padding: 0;
        }

        .navbar-expand-sm .navbar-item {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            margin-bottom: 0;
            list-style: none;
        }

        .navbar.navbar-expand-sm .navbar-item .nav-item {
            align-self: center;
        }

        .navbar.navbar-expand-sm .navbar-item .nav-item.language-dropdown {
            margin-left: 20px;
        }

        .navbar.navbar-expand-sm .navbar-item .nav-item.theme-toggle-item {
            margin-left: 20px;
        }

        .navbar.navbar-expand-sm .navbar-item .nav-item.notification-dropdown {
            margin-left: 20px;
        }

        .navbar.navbar-expand-sm .navbar-item .nav-item.user-profile-dropdown {
            margin: 0 0 0 16px;
        }

        .navbar-expand-sm .navbar-item .nav-link {
            color: #e0e6ed;
            position: unset;
        }

        .navbar .toggle-sidebar,
        .navbar .sidebarCollapse {
            display: inline-block;
            position: relative;
            color: #0e1726;
        }

        .navbar .navbar-item .nav-item.theme-toggle-item .nav-link {
            padding: 4.24px 0;
        }

        .navbar .navbar-item .nav-item.theme-toggle-item .nav-link:after {
            display: none;
        }

        body .navbar .light-mode,
        body:not(.dark) .navbar .light-mode {
            display: inline-block;
            color: #e2a03f;
            fill: #e2a03f;
        }

        body .navbar .dark-mode,
        body:not(.dark) .navbar .dark-mode {
            display: none;
        }

        .navbar .light-mode {
            display: none;
        }

        .navbar .dropdown-menu {
            border-radius: 8px;
            border-color: #e0e6ed;
        }

        .navbar .navbar-item .nav-item.dropdown.show a.nav-link span {
            color: #805dca !important;
        }

        .navbar .navbar-item .nav-item.dropdown.show a.nav-link span.badge {
            background-color: #2196f3 !important;
            color: #fff !important;
        }

        .navbar .navbar-item .nav-item .dropdown-item.active,
        .navbar .navbar-item .nav-item .dropdown-item:active {
            background-color: transparent;
            color: #16181b;
        }

        .navbar .navbar-item .nav-item.dropdown .nav-link:hover span {
            color: #805dca !important;
        }

        .navbar .navbar-item .nav-item.dropdown .dropdown-menu {
            border-radius: 0;
            border: 1px solid #ebedf2;
            border-radius: 8px;
            -webkit-box-shadow: 0 10px 30px 0 rgba(31, 45, 61, 0.1);
            box-shadow: 0 10px 30px 0 rgba(31, 45, 61, 0.1);
            background: #fff;
            left: auto;
            top: 23px !important;
        }

        .navbar .navbar-item .nav-item.dropdown .dropdown-menu.show {
            top: 38px !important;
        }

        .navbar .navbar-item .nav-item.dropdown .dropdown-menu .dropdown-item {
            border-radius: 0;
        }

        .navbar .navbar-item .nav-item.dropdown.language-dropdown a.dropdown-toggle:after {
            display: none;
        }

        .navbar .navbar-item .nav-item.dropdown.language-dropdown a.dropdown-toggle img {
            width: 25px;
            height: 25px;
            border-radius: 8px;
        }

        .navbar .navbar-item .nav-item.dropdown.language-dropdown .dropdown-menu {
            min-width: 7rem;
            right: -8px !important;
            left: auto !important;
        }

        .navbar .navbar-item .nav-item.dropdown.language-dropdown .dropdown-menu .dropdown-item:hover {
            background: transparent !important;
        }

        .navbar .navbar-item .nav-item.dropdown.language-dropdown .dropdown-menu .dropdown-item.active,
        .navbar .navbar-item .nav-item.dropdown.language-dropdown .dropdown-menu .dropdown-item:active {
            background: transparent;
            color: #16181b;
        }

        .navbar .navbar-item .nav-item.dropdown.language-dropdown .dropdown-menu a img {
            width: 20px;
            height: 20px;
            margin-right: 16px;
            border-radius: 8px;
        }

        .navbar .navbar-item .nav-item.dropdown.language-dropdown .dropdown-menu a span {
            color: #515365;
            font-weight: 600;
        }

        .navbar .navbar-item .nav-item.dropdown.language-dropdown .dropdown-menu .dropdown-item:hover span {
            color: #000 !important;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .nav-link:after {
            display: none;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .nav-link svg {
            color: #fff;
            stroke-width: 1.5;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .nav-link span.badge {
            position: absolute;
            display: block;
            width: 5px;
            height: 5px;
            border-radius: 50%;
            padding: 0;
            font-size: 10px;
            color: #fff !important;
            background: #00ab55;
            top: -5px;
            right: 2px;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu {
            min-width: 15rem;
            right: -8px !important;
            left: auto;
            padding: 0;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .notification-scroll {
            height: 375px;
            position: relative;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .drodpown-title {
            padding: 14px 16px;
            border-bottom: 1px solid #e0e6ed;
            border-top: 1px solid #e0e6ed;
            margin-bottom: 10px;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .drodpown-title.message {
            border-top: none;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .drodpown-title h6 {
            margin-bottom: 0;
            font-size: 14px;
            letter-spacing: 1px;
            font-weight: 200;
            color: #0e1726;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .dropdown-item {
            padding: 0.625rem 1rem;
            cursor: pointer;
            border-radius: 0;
            background: transparent;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .media {
            margin: 0;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu img {
            width: 40px;
            height: 40px;
            border-radius: 12px;
            border: 3px solid #e0e6ed;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu svg {
            width: 23px;
            height: 23px;
            font-weight: 600;
            color: #e2a03f;
            margin-right: 9px;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .media.file-upload svg {
            color: #e7515a;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .media.server-log svg {
            color: #009688;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .media-body {
            display: flex;
            justify-content: space-between;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .data-info {
            display: inline-block;
            white-space: normal;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .data-info h6 {
            margin-bottom: 0;
            font-weight: 500;
            font-size: 14px;
            margin-right: 8px;
            color: #515365;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .dropdown-item:hover .data-info h6 {
            color: #4361ee;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .data-info p {
            margin-bottom: 0;
            font-size: 13px;
            font-weight: 600;
            color: #888ea8;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .icon-status {
            white-space: normal;
            display: none;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .dropdown-item:hover .icon-status {
            display: block;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .icon-status svg {
            margin: 0;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .icon-status svg.feather-x {
            color: #bfc9d4;
            width: 19px;
            height: 19px;
            cursor: pointer;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .icon-status svg.feather-x:hover {
            color: #e7515a;
        }

        .navbar .navbar-item .nav-item.notification-dropdown .dropdown-menu .icon-status svg.feather-check {
            color: #fff;
            background: #00ab55;
            border-radius: 50%;
            padding: 3px;
            width: 22px;
            height: 22px;
        }

        .navbar form.form-inline input.search-form-control::-webkit-input-placeholder,
        .navbar form.form-inline input.search-form-control::-ms-input-placeholder,
        .navbar form.form-inline input.search-form-control::-moz-placeholder {
            color: #888ea8;
            letter-spacing: 1px;
        }

        .navbar .form-inline.search {
            display: inline-block;
        }

        .navbar .form-inline.search .search-form-control {
            border: 1px solid rgba(81, 83, 101, 0.28);
            font-size: 14px;
            background-color: rgba(81, 83, 101, 0.28);
            border: none;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            color: #888ea8;
            letter-spacing: 1px;
            padding: 0px 4px 0px 40px;
            height: 36px;
            font-weight: 600;
            width: 370px;
        }

        .navbar .search-animated {
            position: relative;
        }

        .navbar .search-animated .badge {
            position: absolute;
            right: 6px;
            top: 6.5px;
            font-size: 11px;
            letter-spacing: 1px;
            transform: none;
            background-color: #bfc9d4;
            color: #000;
        }

        .navbar .search-animated svg {
            font-weight: 600;
            margin: 0 9.6px;
            cursor: pointer;
            color: #888ea8;
            position: absolute;
            width: 20px;
            height: 20px;
            top: 8px;
            pointer-events: none;
        }

        .navbar .search-animated svg.feather-x {
            display: none;
            width: 18px;
            height: 18px;
        }

        .search-overlay {
            display: none;
            position: fixed;
            width: 100vw;
            height: 100vh;
            background: transparent !important;
            z-index: 814 !important;
            opacity: 0;
            transition: all 0.5s ease-in-out;
        }

        .search-overlay.show {
            display: block;
            opacity: 0.1;
        }


        /* User Profile Dropdown*/

        .navbar .navbar-item .nav-item.dropdown.user-profile-dropdown .nav-link:after {
            display: none;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu {
            padding: 0 10px 10px 10px !important;
            z-index: 9999;
            max-width: 13rem;
            min-width: 11rem;
            right: 4px !important;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu:after {
            border-bottom-color: #b1b2be !important;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .user-profile-section {
            padding: 16px 15px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            margin-right: -10px;
            margin-left: -10px;
            margin-top: -1px;
            margin-bottom: 10px;
            border-bottom: 1px solid #e0e6ed;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .user-profile-section .media {
            margin: 0;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .user-profile-section .media img {
            width: 40px;
            height: 40px;
            border-radius: 12px;
            border: 3px solid rgba(0, 0, 0, 0.16);
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .user-profile-section .media .emoji {
            font-size: 19px;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .user-profile-section .media .media-body {
            align-self: center;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .user-profile-section .media .media-body h5 {
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 3px;
            color: #000;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .user-profile-section .media .media-body p {
            font-size: 13px;
            font-weight: 500;
            margin-bottom: 0;
            color: #4361ee;
        }

        .navbar .navbar-item .nav-item.dropdown.user-profile-dropdown .nav-link:after {
            display: none;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .nav-link svg {
            color: #bfc9d4;
            stroke-width: 1.5;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu.show {
            top: 45px !important;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .dropdown-item {
            padding: 0;
            background: transparent;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .dropdown-item a {
            display: block;
            color: #515365;
            font-size: 14px;
            font-weight: 500;
            padding: 6px 14px;
            border-radius: 8px;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .dropdown-item:hover a {
            color: #4361ee;
            background: #ebedf2;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .dropdown-item.active,
        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .dropdown-item:active {
            background-color: transparent;
        }

        .navbar .navbar-item .nav-item.user-profile-dropdown .dropdown-menu .dropdown-item svg {
            width: 18px;
            margin-right: 7px;
            height: 18px;
        }


        /*
  ===============
      Sidebar
  ===============
  */

        .secondary-nav {
            position: fixed;
            top: 54px;
            width: 100%;
            z-index: 1030;
            left: 0;
            right: 0;
            display: flex;
            -webkit-box-shadow: 0px 0px 15px 1px rgba(138, 132, 206, 0.03);
            -moz-box-shadow: 0px 0px 15px 1px rgba(138, 132, 206, 0.03);
            box-shadow: 0px 20px 20px rgba(126, 142, 177, 0.12);
            background: #fafafa;
            min-height: 52px;
        }

        .secondary-nav .breadcrumbs-container {
            display: flex;
            width: 100%;
        }

        .secondary-nav .breadcrumbs-container .navbar {
            border-radius: 0;
            padding: 9px 0;
            justify-content: flex-start;
            width: 100%;
        }

        .secondary-nav .breadcrumbs-container .navbar .sidebarCollapse {
            position: relative;
            padding: 0 25px 0 31px;
            margin-left: 0;
            padding-left: 31px;
        }

        .secondary-nav .breadcrumbs-container .navbar .sidebarCollapse svg {
            width: 20px;
            height: 20px;
            color: #3b3f5c;
            vertical-align: text-top;
        }

        .secondary-nav .breadcrumbs-container .navbar .breadcrumb-action-dropdown .custom-dropdown-icon {
            padding-right: 24px;
        }

        .secondary-nav .breadcrumbs-container .navbar .breadcrumb-action-dropdown .custom-dropdown-icon a.dropdown-toggle {
            position: relative;
            padding: 9px 35px 9px 10px;
            border: 1px solid #d3d3d3;
            border-radius: 8px;
            transform: none;
            font-size: 13px;
            line-height: 17px;
            background-color: #fff;
            letter-spacing: normal;
            min-width: 115px;
            text-align: inherit;
            color: #1b2e4b;
            box-shadow: none;
            max-height: 35px;
        }

        .secondary-nav .breadcrumbs-container .navbar .breadcrumb-action-dropdown .custom-dropdown-icon a.dropdown-toggle svg.custom-dropdown-arrow {
            position: absolute;
            right: 15px;
            top: 11px;
            color: #888ea8;
            width: 13px;
            height: 13px;
            margin: 0;
            -webkit-transition: -webkit-transform 0.2s ease-in-out;
            transition: -webkit-transform 0.2s ease-in-out;
            transition: transform 0.2s ease-in-out;
            transition: transform 0.2s ease-in-out, -webkit-transform 0.2s ease-in-out;
        }

        .secondary-nav .breadcrumbs-container .navbar .breadcrumb-action-dropdown .custom-dropdown-icon .dropdown-menu {
            top: 3px !important;
            padding: 8px 0;
            border: none;
            min-width: 155px;
            border: 1px solid #d3d3d3;
        }

        .secondary-nav .breadcrumbs-container .navbar .breadcrumb-action-dropdown .custom-dropdown-icon .dropdown-menu a {
            padding: 8px 15px;
            font-size: 13px;
            font-weight: 400;
            color: #3b3f5c;
        }

        .secondary-nav .breadcrumbs-container .navbar .breadcrumb-action-dropdown .custom-dropdown-icon .dropdown-menu a svg {
            width: 20px;
            height: 20px;
            margin-right: 5px;
            stroke-width: 1.5px;
        }

        .secondary-nav .breadcrumbs-container .navbar .breadcrumb-action-dropdown .custom-dropdown-icon .dropdown-menu a:hover {
            color: #2196f3;
            background: rgb(248, 248, 248);
        }


        /*
  ===============
      Sidebar
  ===============
  */

        .sidebar-wrapper {
            width: 212px;
            position: fixed;
            z-index: 1030;
            transition: width 0.1s, left 0.1s;
            height: 100vh;
            touch-action: none;
            user-select: none;
            -webkit-user-drag: none;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            border-right: 1px solid rgb(215, 224, 234);
            top: 107px;
        }

        .shadow-bottom {
            display: block;
            position: absolute;
            z-index: 2;
            height: 33px;
            width: 100%;
            pointer-events: none;
            margin-top: -13px;
            left: -4px;
            -webkit-filter: blur(5px);
            filter: blur(3px);
            background: -webkit-linear-gradient(180deg, #f1f2f3 49%, rgba(241, 242, 243, 0.9490196078) 85%, rgba(44, 48, 60, 0));
            background: linear-gradient(#F2F4F4 41%, rgba(255, 255, 255, 0.11) 95%, rgba(255, 255, 255, 0));
        }

        .sidebar-theme {
            background: transparent;
        }

        .sidebar-closed {
            padding: 0;
        }

        .sidebar-closed .sidebar-wrapper {
            width: 0;
            left: -212px;
        }

        .sidebar-closed .sidebar-wrapper:hover {
            width: 255px;
        }

        .sidebar-closed .sidebar-wrapper:hover span.sidebar-label {
            display: inline-block;
        }

        .sidebar-closed .sidebar-wrapper span.sidebar-label {
            display: none;
        }

        .sidebar-closed #content {
            margin-left: 0;
        }

        #sidebar .theme-brand {
            background-color: transparent;
            padding: 10px 12px 6px 21px;
            border-bottom: 1px solid #fff;
            border-radius: 8px 6px 0 0;
            justify-content: space-between;
            display: none;
        }

        .sidebar-closed #sidebar .theme-brand {
            padding: 18px 12px 13px 21px;
        }

        .sidebar-closed>.sidebar-wrapper:hover #sidebar .theme-brand {
            padding: 10px 12px 6px 21px;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .nav-logo {
            display: flex;
        }

        #sidebar .theme-brand div.theme-logo {
            align-self: center;
        }

        #sidebar .theme-brand div.theme-logo img {
            width: 40px;
            height: 40px;
        }

        .sidebar-closed .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle {
            display: none;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle {
            align-self: center;
            cursor: pointer;
            overflow: unset !important;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle .sidebarCollapse {
            position: relative;
            overflow: unset !important;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle .sidebarCollapse:before {
            position: absolute;
            content: "";
            height: 40px;
            width: 40px;
            background: rgba(0, 0, 0, 0.0705882353);
            top: 0;
            bottom: 0;
            margin: auto;
            border-radius: 50%;
            left: -8px;
            right: 0;
            z-index: 0;
            opacity: 0;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle .sidebarCollapse:hover:before {
            opacity: 1;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle .btn-toggle svg {
            width: 25px;
            height: 25px;
            color: #fff;
            transform: rotate(0);
            -webkit-transition: 0.3s ease all;
            transition: 0.3s ease all;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle .btn-toggle svg polyline:nth-child(1) {
            color: #3b3f5c;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle .btn-toggle svg polyline:nth-child(2) {
            color: #888ea8;
        }

        .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle .btn-toggle svg:hover {
            color: #e6f4ff;
        }

        .sidebar-closed .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle .btn-toggle svg {
            transform: rotate(-180deg);
        }

        .sidebar-closed #sidebar .theme-brand div.theme-text {
            display: none;
        }

        .sidebar-closed>.sidebar-wrapper:hover #sidebar .theme-brand li.theme-text a,
        .sidebar-closed>.sidebar-wrapper:hover #sidebar .theme-brand div.theme-text,
        .sidebar-closed>.sidebar-wrapper:hover #sidebar .theme-brand .sidebar-toggle {
            display: block;
        }

        #sidebar .theme-brand div.theme-text a {
            font-size: 25px !important;
            color: #191e3a !important;
            line-height: 2.75rem;
            padding: 0.39rem 0.8rem;
            text-transform: initial;
            position: unset;
            font-weight: 700;
        }

        #sidebar .navbar-brand .img-fluid {
            display: inline;
            width: 44px;
            height: auto;
            margin-left: 20px;
            margin-top: 5px;
        }

        #sidebar * {
            overflow: hidden;
            white-space: nowrap;
        }

        #sidebar ul.menu-categories {
            position: relative;
            padding: 0 0 20px 0;
            margin: auto;
            width: 100%;
            overflow: auto;
        }

        #sidebar ul.menu-categories.ps {
            height: calc(100vh - 71px) !important;
            padding-right: 16px;
        }

        #sidebar ul.menu-categories li>.dropdown-toggle[aria-expanded=true] svg.feather-chevron-right {
            transform: rotate(90deg);
        }

        .sidebar-wrapper ul.menu-categories li.menu.menu-heading {
            height: 56px;
            display: none;
        }

        .sidebar-wrapper ul.menu-categories li.menu.menu-heading>.heading .feather-minus {
            display: none;
            vertical-align: sub;
            width: 12px;
            height: 12px;
            stroke-width: 4px;
            color: #506690;
        }

        .sidebar-closed .sidebar-wrapper ul.menu-categories li.menu.menu-heading>.heading .feather-minus {
            display: inline-block;
        }

        .sidebar-closed .sidebar-wrapper:hover ul.menu-categories li.menu.menu-heading>.heading .feather-minus {
            display: none;
        }

        .sidebar-wrapper ul.menu-categories li.menu.menu-heading>.heading {
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            color: #888ea8;
            padding: 32px 0 10px 36px;
            letter-spacing: 1px;
        }

        .sidebar-closed>.sidebar-wrapper ul.menu-categories li.menu.menu-heading>.heading span {
            display: none;
        }

        .sidebar-closed>.sidebar-wrapper:hover ul.menu-categories li.menu.menu-heading>.heading span {
            display: inline-block;
        }

        .sidebar-closed #sidebar ul.menu-categories li.menu>.dropdown-toggle {
            padding: 10px 16px;
            transition: 0.6s;
            position: relative;
        }

        .sidebar-closed>.sidebar-wrapper:hover #sidebar ul.menu-categories li.menu>.dropdown-toggle {
            transition: 0.6s;
        }

        .sidebar-closed .sidebar-wrapper:hover #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=true]:before,
        .sidebar-closed #sidebar ul.menu-categories li.menu>.dropdown-toggle svg.feather-chevron-right {
            display: none;
        }

        .sidebar-closed .sidebar-wrapper:hover #sidebar ul.menu-categories li.menu>.dropdown-toggle svg.feather-chevron-right {
            display: inline-block;
        }

        .sidebar-closed .sidebar-wrapper:hover #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=true] svg {
            padding: 0;
            background: transparent;
            border-radius: 0;
            border: none;
            width: auto;
            width: 20px;
            height: 20px;
        }

        #sidebar ul.menu-categories li.menu:first-child a.dropdown-toggle {
            margin-top: 21px;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle {
            display: flex;
            justify-content: space-between;
            cursor: pointer;
            font-size: 14px;
            color: #191e3a;
            padding: 10.2px 16px;
            font-weight: 600;
            letter-spacing: 1px;
            margin-bottom: 2px;
            border-radius: 8px;
            margin-top: 2px;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle.disabled {
            opacity: 0.5;
            cursor: default;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle.disabled svg:not(.bage-icon) {
            opacity: 0.5;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle.disabled:hover {
            color: #191e3a;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle.disabled:hover svg:not(.bage-icon) {
            color: #515365;
            opacity: 0.5;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle>div {
            align-self: center;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle>div span.sidebar-label {
            position: absolute;
            right: 12px;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle>div span.sidebar-label svg {
            width: 15px;
            height: 15px;
            vertical-align: sub;
        }

        #sidebar ul.menu-categories li.menu .dropdown-toggle:after {
            display: none;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle svg:not(.badge-icon) {
            color: #506690;
            margin-right: 10px;
            vertical-align: middle;
            width: 20px;
            height: 20px;
            stroke-width: 1.6;
        }

        #sidebar ul.menu-categories li.menu.active>.dropdown-toggle {
            background: #fff;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
        }

        #sidebar ul.menu-categories li.menu.active>.dropdown-toggle[aria-expanded=true] {
            background: #fff;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            border-radius: 6px;
        }

        #sidebar ul.menu-categories li.menu.active>.dropdown-toggle[aria-expanded=true]:hover {
            background: #bfc9d4;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            border-radius: 6px;
        }

        #sidebar ul.menu-categories li.menu.active>.dropdown-toggle[aria-expanded=true] svg.feather {
            color: #030305;
            fill: #e0e6ed;
        }

        #sidebar ul.menu-categories li.menu.active>.dropdown-toggle svg.feather {
            color: #030305;
            fill: #e0e6ed;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=false] svg.feather-chevron-right {
            transform: rotate(0);
            transition: 0.5s;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=true] {
            background: #bfc9d4;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            border-radius: 6px;
            color: #0e1726;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=true] svg {
            color: #030305;
            fill: #e0e6ed;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=true] svg.feather-chevron-right {
            background-color: transparent;
            transform: rotate(90deg);
            transition: 0.5s;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=true] span {
            color: #000;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=true]:hover {
            color: #000;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle[aria-expanded=true]:hover svg {
            color: #000 !important;
            fill: rgba(67, 97, 238, 0.0392156863);
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle:hover {
            background: #bfc9d4;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            border-radius: 6px;
            color: #030305;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle:hover svg:not(.badge-icon) {
            color: #030305;
        }

        #sidebar ul.menu-categories li.menu>.dropdown-toggle svg.feather-chevron-right {
            vertical-align: middle;
            margin-right: 0;
            width: 15px;
        }

        #sidebar ul.menu-categories li.menu>a span:not(.badge) {
            vertical-align: middle;
        }

        #sidebar ul.menu-categories ul.submenu>li a {
            position: relative;
            display: flex;
            justify-content: space-between;
            padding: 10px 12px 10px 48px;
            padding-left: 24px;
            margin-left: 36px;
            font-size: 14px;
            color: #515365;
        }

        #sidebar ul.menu-categories li.menu ul.submenu>li a:before {
            content: "";
            background-color: #506690;
            position: absolute;
            height: 3px;
            width: 3px;
            top: 18.5px;
            left: 13px;
            border-radius: 50%;
        }

        #sidebar ul.menu-categories li.menu ul.submenu>li a:hover {
            color: #4361ee;
        }

        #sidebar ul.menu-categories li.menu ul.submenu>li a:hover:before {
            background: #4361ee !important;
        }

        #sidebar ul.menu-categories li.menu ul.submenu>li.active a {
            color: #4361ee;
        }

        #sidebar ul.menu-categories li.menu ul.submenu>li.active a:before {
            background-color: #506690;
        }

        #sidebar ul.menu-categories li.menu ul.submenu>li.active a:hover {
            color: #4361ee !important;
        }

        #sidebar ul.menu-categories li.menu ul.submenu>li.active a:hover:before {
            background: #4361ee !important;
        }

        #sidebar ul.menu-categories ul.submenu>li {
            margin-top: 3px;
        }

        #sidebar ul.menu-categories ul.submenu>li a:hover {
            color: #4361ee;
        }

        #sidebar ul.menu-categories ul.submenu>li a:hover:before {
            background-color: #4361ee;
        }

        #sidebar ul.menu-categories ul.submenu>li a i {
            align-self: center;
            font-size: 9px;
        }

        #sidebar ul.menu-categories ul.submenu li>[aria-expanded=true] i {
            color: #fff;
        }

        #sidebar ul.menu-categories ul.submenu li>[aria-expanded=true]:before {
            background-color: #fff;
        }

        #sidebar ul.menu-categories ul.submenu li>a[aria-expanded=true] {
            color: #4361ee;
        }

        #sidebar ul.menu-categories ul.submenu li>a[aria-expanded=true]:before {
            background-color: #4361ee !important;
        }

        #sidebar ul.menu-categories ul.submenu>li a.dropdown-toggle {
            padding: 10px 32px 10px 33px;
            padding: 10px 12px 10px 48px;
            padding-left: 24px;
            margin-left: 36px;
        }

        #sidebar ul.menu-categories ul.submenu>li a.dropdown-toggle svg {
            align-self: center;
            transition: 0.3s;
            width: 13px;
            height: 13px;
        }

        #sidebar ul.menu-categories ul.submenu>li ul.sub-submenu>li a {
            position: relative;
            padding: 10px 12px 10px 48px;
            padding-left: 15px;
            margin-left: 56px;
            font-size: 14px;
            color: #515365 !important;
            letter-spacing: 1px;
        }

        #sidebar ul.menu-categories ul.submenu>li ul.sub-submenu>li.active a {
            color: #4361ee !important;
        }

        #sidebar ul.menu-categories ul.submenu>li ul.sub-submenu>li a:hover {
            color: #4361ee;
        }

        #sidebar ul.menu-categories ul.submenu>li ul.sub-submenu>li a:hover:before {
            background-color: #4361ee;
            box-shadow: none;
        }

        #sidebar ul.menu-categories ul.submenu>li ul.sub-submenu>li a:before {
            content: "";
            background-color: #bfc9d4;
            position: absolute;
            top: 19.5px !important;
            border-radius: 50%;
            left: 3px;
            height: 3px;
            width: 3px;
        }

        #sidebar ul.menu-categories ul.submenu>li ul.sub-submenu>li.active a:before {
            background-color: #009688;
        }

        .overlay {
            display: none;
            position: fixed;
            width: 100vw;
            height: 100vh;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1035 !important;
            opacity: 0;
            transition: all 0.5s ease-in-out;
            top: 0;
            bottom: 0;
            right: 0;
            left: 0;
            touch-action: pan-y;
            user-select: none;
            -webkit-user-drag: none;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }

        .e-animated {
            -webkit-animation-duration: 0.6s;
            animation-duration: 0.6s;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
        }

        @-webkit-keyframes e-fadeInUp {
            0% {
                opacity: 0;
                margin-top: 10px;
            }
            100% {
                opacity: 1;
                margin-top: 0;
            }
        }

        @keyframes e-fadeInUp {
            0% {
                opacity: 0;
                margin-top: 10px;
            }
            100% {
                opacity: 1;
                margin-top: 0;
            }
        }

        .e-fadeInUp {
            -webkit-animation-name: e-fadeInUp;
            animation-name: e-fadeInUp;
        }


        /*
      ======================
          Footer-wrapper
      ======================
  */

        .footer-wrapper {
            padding: 10px 0 10px 0;
            display: inline-block;
            background: transparent;
            font-weight: 600;
            font-size: 12px;
            width: 100%;
            border-top-left-radius: 8px;
            display: flex;
            justify-content: space-between;
            padding: 10px 24px 10px 24px;
            margin: auto;
            margin-top: 15px;
        }

        .layout-boxed .footer-wrapper {
            max-width: 1488px;
        }

        .main-container.sidebar-closed .footer-wrapper {
            border-radius: 0;
        }

        .footer-wrapper .footer-section p {
            margin-bottom: 0;
            color: #888ea8;
            font-size: 14px;
            letter-spacing: 1px;
        }

        .footer-wrapper .footer-section p a {
            color: #888ea8;
        }

        .footer-wrapper .footer-section svg {
            color: #e7515a;
            fill: #e7515a;
            width: 15px;
            height: 15px;
            vertical-align: sub;
        }

        body.alt-menu .header-container {
            transition: none;
        }

        body.alt-menu #content {
            transition: none;
        }


        /*
      ======================
          MEDIA QUERIES
      ======================
  */

        @media (max-width: 991px) {
            .header-container.container-xxl {
                left: 0;
            }
            .header-container .theme-text {
                margin-right: 0;
            }
            .layout-px-spacing {
                padding: 0 16px !important;
            }
            /*
      =============
          NavBar
      =============
  */
            .main-container.sidebar-closed #content {
                margin-left: 0;
            }
            .navbar .search-animated {
                margin-left: auto;
            }
            .navbar .search-animated svg {
                margin-right: 0;
                display: block;
            }
            .search-active .form-inline.search {
                display: flex;
            }
            /*
      =============
          Sidebar
      =============
  */
            #content {
                margin-left: 0;
            }
            #sidebar .theme-brand {
                border-radius: 0;
                padding: 14px 12px 13px 21px;
            }
            .sidebar-closed #sidebar .theme-brand {
                padding: 14px 12px 13px 21px;
            }
            .sidebar-closed #sidebar .theme-brand div.theme-text {
                display: block;
            }
            .sidebar-closed .sidebar-wrapper.sidebar-theme .theme-brand .sidebar-toggle {
                display: block;
            }
            .main-container:not(.sbar-open) .sidebar-wrapper {
                width: 0;
                left: -52px;
            }
            body.alt-menu .sidebar-closed>.sidebar-wrapper {
                width: 255px;
                left: -255px;
            }
            .main-container {
                padding: 0;
            }
            #sidebar ul.menu-categories.ps {
                height: calc(100vh - 1px) !important;
                padding-left: 16px;
            }
            .sidebar-wrapper {
                top: 0;
                bottom: 0;
                z-index: 9999;
                border-radius: 0;
                left: 0;
                width: 255px;
                background: #f1f2f3;
            }
            .sidebar-noneoverflow {
                overflow: hidden;
            }
            #sidebar {
                height: 100vh !important;
                backface-visibility: hidden;
                -webkit-backface-visibility: hidden;
                -webkit-transform: translate3d(0, 0, 0);
            }
            /* display .overlay when it has the .active class */
            .overlay.show {
                display: block;
                opacity: 0.7;
            }
        }

        @media (min-width: 992px) {
            .sidebar-noneoverflow .header-container.container-xxl {
                left: 84px;
            }
            .sidebar-closed #sidebar .theme-brand li.theme-text a {
                display: none;
            }
        }

        @media (max-width: 767px) {
            .header-container {
                padding: 7.5px 20px 7.5px 16px;
            }
            .header-container .navbar.navbar-expand-sm .navbar-item.theme-brand {
                padding-left: 0;
            }
            .header-container .navbar.navbar-expand-sm .navbar-item .nav-item.theme-text {
                display: none;
            }
            .header-container .navbar.navbar-expand-sm .search-animated {
                position: relative;
                display: flex;
            }
            .header-container .navbar.navbar-expand-sm .search-animated svg.feather-search {
                font-weight: 600;
                margin: 0 9.6px;
                margin: 0;
                cursor: pointer;
                color: #e0e6ed;
                position: initial;
                width: 24px;
                height: 24px;
                transition: top 200ms;
                top: -25px;
            }
            .header-container .navbar.navbar-expand-sm .search-animated form.form-inline input {
                display: none;
            }
            .header-container .navbar.navbar-expand-sm .search-animated .badge {
                display: none;
            }
            .header-container .navbar.navbar-expand-sm .search-animated.show-search form {
                position: fixed;
                top: 0;
                background: #060818;
                height: 55px;
                width: 100%;
                left: 0;
                right: 0;
                z-index: 32;
                margin-top: 0px !important;
                display: flex;
                opacity: 1;
                transition: opacity 200ms, top 200ms;
            }
            .header-container .navbar.navbar-expand-sm .search-animated.show-search form.form-inline .search-bar {
                width: 100%;
            }
            .header-container .navbar.navbar-expand-sm .search-animated.show-search form.form-inline .search-bar input {
                display: block;
                width: 100%;
                height: 100%;
                border-radius: 0;
                padding-left: 24px;
            }
            .header-container .navbar.navbar-expand-sm .search-animated.show-search form.form-inline .search-bar .search-close {
                display: block;
                right: 10px;
                top: 17px;
            }
            .header-container .navbar.navbar-expand-sm .action-area {
                padding: 0;
            }
            .secondary-nav .breadcrumbs-container .navbar .sidebarCollapse {
                padding: 0 13px 0 24px;
            }
            .secondary-nav .breadcrumbs-container .navbar .breadcrumb-content .page-header nav .breadcrumb .breadcrumb-item:not(.active) {
                display: none;
            }
            .secondary-nav .breadcrumbs-container .navbar .breadcrumb-content .page-header nav .breadcrumb .breadcrumb-item.active {
                padding-left: 0;
                vertical-align: sub;
                font-size: 15px;
                font-weight: 600;
            }
            .secondary-nav .breadcrumbs-container .navbar .breadcrumb-content .page-header nav .breadcrumb .breadcrumb-item.active:before {
                display: none;
            }
        }

        @media (max-width: 575px) {
            .navbar .navbar-item .nav-item.dropdown.message-dropdown .dropdown-menu {
                right: auto;
                left: -76px !important;
            }
            .navbar .navbar-item .nav-item.dropdown.notification-dropdown .dropdown-menu {
                right: -64px !important;
            }
            .navbar .navbar-item .nav-item.dropdown.language-dropdown .dropdown-menu {
                right: auto !important;
                left: -56px !important;
            }
            .footer-wrapper .footer-section.f-section-2 {
                display: none;
            }
        }

        html {
            min-height: 100%;
        }

        body {
            color: #888ea8;
            height: 100%;
            font-size: 0.875rem;
            background: #f1f2f3;
            overflow-y: auto;
            letter-spacing: 0.0312rem;
            font-family: "Nunito", sans-serif;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            color: #3b3f5c;
        }

        a {
            text-decoration: none;
            background-color: transparent;
        }

        :focus {
            outline: none;
        }

        p {
            margin-top: 0;
            margin-bottom: 0.625rem;
            color: #515365;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border-top: 1px solid #f1f2f3;
        }

        strong {
            font-weight: 600;
        }

        code {
            color: #e7515a;
        }

        body.dark .dark-element {
            display: block;
        }

        .dark-element {
            display: none;
        }

        body.dark .light-element {
            display: none;
        }

        .light-element {
            display: block;
        }

        select.form-custom::-ms-expand {
            display: none;
        }

        .custom-file-input:focus~.custom-file-label {
            border: 1px solid #3b3f5c;
            box-shadow: none;
        }

        .custom-file-input:focus~.custom-file-label::after {
            border: none;
            border-left: 1px solid #3b3f5c;
        }

        .lead a.btn.btn-primary.btn-lg {
            margin-top: 15px;
            border-radius: 4px;
        }

        .jumbotron {
            background-color: #1b2e4b;
        }

        .mark,
        mark {
            background-color: #bfc9d4;
        }

        .modal-content {
            background: #0e1726;
        }

        .code-section-container {
            margin-top: 20px;
            text-align: left;
        }

        .toggle-code-snippet {
            border: none;
            background-color: transparent !important;
            padding: 0px !important;
            box-shadow: none !important;
            color: #888ea8 !important;
            margin-bottom: -24px;
            border-bottom: 1px dashed #bfc9d4;
            border-radius: 0 !important;
        }

        .toggle-code-snippet svg {
            color: #888ea8;
        }

        .toggle-code-snippet .toggle-code-icon {
            width: 16px;
            height: 16px;
            transition: 0.3s;
            transform: rotate(-90deg);
            vertical-align: text-top;
        }

        .code-section-container.show-code .toggle-code-snippet .toggle-code-icon {
            transform: rotate(0deg);
        }

        .code-section {
            padding: 0;
            height: 0;
        }

        .code-section-container.show-code .code-section {
            margin-top: 20px;
            height: auto;
        }

        .code-section pre {
            margin-bottom: 0;
            height: 0;
            padding: 0;
            border-radius: 6px;
        }

        .code-section-container.show-code .code-section pre {
            height: auto;
            padding: 22px;
        }

        .code-section code {
            color: #fff;
        }

        @media (min-width: 1400px) {
            .container,
            .container-lg,
            .container-md,
            .container-sm,
            .container-xl,
            .container-xxl {
                max-width: 1440px;
            }
        }


        /* Media Object */

        .media {
            display: flex;
            -ms-flex-align: start;
            align-items: flex-start;
        }

        .media-body {
            -ms-flex: 1;
            flex: 1;
        }


        /*blockquote*/

        blockquote.blockquote {
            color: #009688;
            padding: 20px 20px 20px 14px;
            font-size: 0.875rem;
            background-color: #fff;
            border-bottom-right-radius: 8px;
            border-top-right-radius: 8px;
            border: 1px solid #e0e6ed;
            border-left: 2px solid #4361ee;
            box-shadow: 0 0.1px 0px rgba(0, 0, 0, 0), 0 0.2px 0px rgba(0, 0, 0, 0), 0 0.4px 0px rgba(0, 0, 0, 0), 0 0.6px 0px rgba(0, 0, 0, 0), 0 0.9px 0px rgba(0, 0, 0, 0.01), 0 1.2px 0px rgba(0, 0, 0, 0.01), 0 1.8px 0px rgba(0, 0, 0, 0.01), 0 2.6px 0px rgba(0, 0, 0, 0.01), 0 3.9px 0px rgba(0, 0, 0, 0.01), 0 7px 0px rgba(0, 0, 0, 0.01);
        }

        blockquote.blockquote>p {
            margin-bottom: 0;
        }

        blockquote .small:before,
        blockquote footer:before,
        blockquote small:before {
            content: "— ";
        }

        blockquote .small,
        blockquote footer,
        blockquote small {
            display: block;
            font-size: 80%;
            line-height: 1.42857143;
            color: #888ea8;
        }

        blockquote.media-object.m-o-border-right {
            border-right: 4px solid #009688;
            border-left: none;
        }

        blockquote.media-object .media .usr-img img {
            width: 55px;
        }


        /* Icon List */

        .list-icon {
            list-style: none;
            padding: 0;
            margin-bottom: 0;
        }

        .list-icon li:not(:last-child) {
            margin-bottom: 15px;
        }

        .list-icon svg {
            width: 18px;
            height: 18px;
            color: #2196f3;
            margin-right: 2px;
            vertical-align: sub;
        }

        .list-icon .list-text {
            font-size: 14px;
            font-weight: 600;
            color: #515365;
            letter-spacing: 1px;
        }

        a {
            color: #515365;
            outline: none;
        }

        a:hover {
            color: #888ea8;
            text-decoration: none;
        }

        a:focus {
            outline: none;
            text-decoration: none;
        }

        button:focus {
            outline: none;
        }

        textarea {
            outline: none;
        }

        textarea:focus {
            outline: none;
        }

        .btn-link:hover {
            text-decoration: none;
        }

        span.blue {
            color: #4361ee;
        }

        span.green {
            color: #00ab55;
        }

        span.red {
            color: #e7515a;
        }


        /*      CARD    */

        .card {
            border: 1px solid #e0e6ed;
            border-radius: 10px;
            background: #fff;
            box-shadow: rgba(145, 158, 171, 0.2) 0px 0px 2px 0px, rgba(145, 158, 171, 0.12) 0px 12px 24px -4px;
        }

        .card-img,
        .card-img-top {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card {
            /* Card Style 2 */
            /* Card Style 3 */
            /* Card Style 4 */
            /* Card Style 5 */
            /* Card Style 6 */
            /* Card Style 7 */
        }

        .card .card-header {
            color: #3b3f5c;
            border-bottom: 1px solid #e0e6ed;
            padding: 12px 20px;
        }

        .card .card-footer {
            border-top: 1px solid #e0e6ed;
            padding: 12px 20px;
            background-color: transparent;
        }

        .card .card-body {
            padding: 24px 20px;
        }

        .card .card-title {
            color: #0e1726;
            line-height: 1.5;
        }

        .card .card-text {
            color: #888ea8;
        }

        .card .media img.card-media-image {
            border-radius: 50%;
            width: 45px;
            height: 45px;
        }

        .card .media .media-body .media-heading {
            font-size: 14px;
            font-weight: 500;
        }

        .card.bg-primary .card-title {
            color: #fff;
        }

        .card.bg-primary .card-text {
            color: #e0e6ed;
        }

        .card.bg-primary p {
            color: #e0e6ed;
        }

        .card.bg-primary a {
            color: #bfc9d4;
        }

        .card.bg-info .card-title {
            color: #fff;
        }

        .card.bg-info .card-text {
            color: #e0e6ed;
        }

        .card.bg-info p {
            color: #e0e6ed;
        }

        .card.bg-info a {
            color: #bfc9d4;
        }

        .card.bg-success .card-title {
            color: #fff;
        }

        .card.bg-success .card-text {
            color: #e0e6ed;
        }

        .card.bg-success p {
            color: #e0e6ed;
        }

        .card.bg-success a {
            color: #bfc9d4;
        }

        .card.bg-warning .card-title {
            color: #fff;
        }

        .card.bg-warning .card-text {
            color: #e0e6ed;
        }

        .card.bg-warning p {
            color: #e0e6ed;
        }

        .card.bg-warning a {
            color: #bfc9d4;
        }

        .card.bg-danger .card-title {
            color: #fff;
        }

        .card.bg-danger .card-text {
            color: #e0e6ed;
        }

        .card.bg-danger p {
            color: #e0e6ed;
        }

        .card.bg-danger a {
            color: #bfc9d4;
        }

        .card.bg-secondary .card-title {
            color: #fff;
        }

        .card.bg-secondary .card-text {
            color: #e0e6ed;
        }

        .card.bg-secondary p {
            color: #e0e6ed;
        }

        .card.bg-secondary a {
            color: #bfc9d4;
        }

        .card.bg-dark .card-title {
            color: #fff;
        }

        .card.bg-dark .card-text {
            color: #e0e6ed;
        }

        .card.bg-dark p {
            color: #e0e6ed;
        }

        .card.bg-dark a {
            color: #bfc9d4;
        }

        .card.style-2 {
            padding: 15px 18px;
            border-radius: 15px;
        }

        .card.style-2 .card-img,
        .card.style-2 .card-img-top {
            border-radius: 15px;
            box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.14), 0 1px 18px 0 rgba(0, 0, 0, 0.12), 0 3px 5px -1px rgba(0, 0, 0, 0.2);
        }

        .card.style-3 {
            padding: 10px 10px;
            border-radius: 15px;
            flex-direction: row;
        }

        .card.style-3 .card-img,
        .card.style-3 .card-img-top {
            border-radius: 15px;
            box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.14), 0 1px 18px 0 rgba(0, 0, 0, 0.12), 0 3px 5px -1px rgba(0, 0, 0, 0.2);
            width: 50%;
            margin-right: 25px;
        }

        .card.style-4 .media img.card-media-image {
            width: 55px;
            height: 55px;
        }

        .card.style-4 .media .media-body .media-heading {
            font-size: 16px;
        }

        .card.style-4 .media .media-body .media-text {
            font-size: 14px;
        }

        .card.style-4 .progress {
            background-color: #ebedf2;
        }

        .card.style-4 .attachments {
            cursor: pointer;
        }

        .card.style-4 .attachments:hover {
            color: #00ab55;
        }

        .card.style-4 .attachments svg {
            width: 18px;
            height: 18px;
            stroke-width: 1.6;
        }

        .card.style-5 {
            flex-direction: row;
        }

        .card.style-5 .card-top-content {
            padding: 24px 0 24px 20px;
        }

        .card.style-5 .card-content {
            -ms-flex: 1;
            flex: 1;
        }

        .card.style-6 .badge:not(.badge-dot) {
            position: absolute;
            right: 8px;
            top: 8px;
        }

        .card.style-7 .card-img-top {
            border-radius: 10px;
        }

        .card.style-7 .card-header {
            position: absolute;
            width: 100%;
            top: 0;
            border: none;
            background-color: rgba(0, 0, 0, 0.3803921569);
            backdrop-filter: saturate(180%) blur(10px);
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card.style-7 .card-footer {
            position: absolute;
            width: 100%;
            bottom: 0;
            border: none;
            background-color: rgba(0, 0, 0, 0.3803921569);
            backdrop-filter: saturate(180%) blur(10px);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .card.style-7 .card-title {
            color: #fff;
        }

        .card.style-7 .card-text {
            color: #e0e6ed;
        }

        @media (max-width: 575px) {
            /* Card Style 3 */
            .card.style-3 {
                flex-direction: column;
            }
            .card.style-3 .card-img,
            .card.style-3 .card-img-top {
                width: 100%;
                height: auto;
                margin-bottom: 15px;
            }
        }


        /* clears the 'X' from Chrome */

        input[type=search]::-webkit-search-decoration,
        input[type=search]::-webkit-search-cancel-button,
        input[type=search]::-webkit-search-results-button,
        input[type=search]::-webkit-search-results-decoration {
            display: none;
        }


        /* clears the 'X' from Internet Explorer */

        input[type=search]::-ms-clear {
            display: none;
            width: 0;
            height: 0;
        }

        input[type=search]::-ms-reveal {
            display: none;
            width: 0;
            height: 0;
        }


        /*      Form Group Label       */

        .form-group label,
        label {
            font-size: 15px;
            color: #0e1726;
            letter-spacing: 1px;
            display: inline-block;
            margin-bottom: 0.5rem;
        }


        /*  Disable forms     */

        .custom-control-input:disabled~.custom-control-label {
            color: #d3d3d3;
            cursor: no-drop;
        }

        .form-control:disabled:not(.flatpickr-input),
        .form-control[readonly]:not(.flatpickr-input) {
            background-color: #f1f2f3;
            cursor: no-drop;
            color: #d3d3d3;
        }

        .form-control:disabled:focus,
        .form-control[readonly]:focus {
            background-color: #f1f2f3;
        }

        .form-control:disabled::-webkit-input-placeholder,
        .form-control:disabled::-ms-input-placeholder,
        .form-control:disabled::-moz-placeholder,
        .form-control[readonly]::-webkit-input-placeholder,
        .form-control[readonly]::-ms-input-placeholder,
        .form-control[readonly]::-moz-placeholder {
            color: #888ea8;
            font-size: 15px;
        }

        .custom-control-input:disabled~.form-check-input,
        .custom-control-input[disabled]~.form-check-input {
            background-color: #3b3f5c;
            cursor: no-drop;
        }


        /*      Form Control       */

        .form-control {
            height: auto;
            border: 1px solid #bfc9d4;
            color: #3b3f5c;
            font-size: 15px;
            padding: 8px 10px;
            letter-spacing: 1px;
            padding: 0.75rem 1.25rem;
            border-radius: 6px;
            background: #fff;
            height: auto;
            transition: none;
        }

        .form-text {
            color: #fff;
        }

        @supports (-webkit-overflow-scrolling: touch) {
            /* CSS specific to iOS devices */
            .form-control {
                color: #0e1726;
            }
        }

        .form-control[type=range] {
            padding: 0;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #4361ee;
            color: #3b3f5c;
            background-color: #fff;
        }

        .form-control::-webkit-input-placeholder,
        .form-control::-ms-input-placeholder,
        .form-control::-moz-placeholder {
            color: #888ea8;
            font-size: 15px;
        }

        .form-control:focus::-webkit-input-placeholder,
        .form-control:focus::-ms-input-placeholder,
        .form-control:focus::-moz-placeholder {
            color: #bfc9d4;
            font-size: 15px;
        }

        .form-control.form-control-lg {
            font-size: 19px;
            padding: 11px 20px;
        }

        .form-control.form-control-sm {
            padding: 7px 16px;
            font-size: 13px;
        }

        .form-select.form-control-sm {
            padding: 7px 16px;
            font-size: 13px;
        }


        /*      Custom Select       */

        .form-check {
            min-height: auto;
        }

        .form-check-input {
            background-color: #e0e6ed;
            border-color: #e0e6ed;
            width: 17px;
            height: 17px;
            margin-top: 0.21em;
            transition: background-color 0.15s ease-in-out, background-position 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .form-check-input:focus {
            border-color: #e0e6ed;
            box-shadow: none;
        }

        .form-check-input:checked {
            background-color: #4361ee;
            border-color: #4361ee;
        }

        .form-check:not(.form-switch) .form-check-input:checked[type=checkbox] {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 13 11' width='13' height='11' fill='none'%3e%3cpath d='M11.0426 1.02893C11.3258 0.695792 11.8254 0.655283 12.1585 0.938451C12.4917 1.22162 12.5322 1.72124 12.249 2.05437L5.51985 9.97104C5.23224 10.3094 4.72261 10.3451 4.3907 10.05L0.828197 6.88335C0.50141 6.59288 0.471975 6.09249 0.762452 5.7657C1.05293 5.43891 1.55332 5.40948 1.88011 5.69995L4.83765 8.32889L11.0426 1.02893Z' fill='%23FFFFFF'/%3e%3c/svg%3e");
            background-size: 60% 60%;
        }

        .form-check .form-check-input {
            margin-left: -1.6em;
        }

        .form-check-input:checked[type=checkbox]:not([role=switch]) {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 13 11' width='13' height='11' fill='none'%3e%3cpath d='M11.0426 1.02893C11.3258 0.695792 11.8254 0.655283 12.1585 0.938451C12.4917 1.22162 12.5322 1.72124 12.249 2.05437L5.51985 9.97104C5.23224 10.3094 4.72261 10.3451 4.3907 10.05L0.828197 6.88335C0.50141 6.59288 0.471975 6.09249 0.762452 5.7657C1.05293 5.43891 1.55332 5.40948 1.88011 5.69995L4.83765 8.32889L11.0426 1.02893Z' fill='%23FFFFFF'/%3e%3c/svg%3e");
            background-size: 60% 60%;
        }


        /*      Custom Select       */

        .form-select {
            height: auto;
            font-size: 15px;
            padding: 0.75rem 1.25rem;
            letter-spacing: 1px;
            border: 1px solid #bfc9d4;
            color: #3b3f5c;
            background-color: #fff;
            border-radius: 6px;
            margin-left: 40%;
            transition: none;
        }

        .form-select.form-select-lg {
            font-size: 19px;
            padding: 11px 20px;
        }

        .form-select.form-select-sm {
            padding: 7px 16px;
            font-size: 13px;
        }

        .form-select:focus {
            box-shadow: none;
            border-color: #4361ee;
            color: #3b3f5c;
            background-color: #fff;
        }


        /*      Form Control File       */

        .form-control-file {
            width: 100%;
            color: #805dca;
        }

        .form-control-file::-webkit-file-upload-button {
            letter-spacing: 1px;
            padding: 9px 20px;
            text-shadow: none;
            font-size: 12px;
            color: #fff;
            font-weight: normal;
            white-space: normal;
            word-wrap: break-word;
            transition: 0.2s ease-out;
            touch-action: manipulation;
            cursor: pointer;
            background-color: #805dca;
            box-shadow: 0px 0px 15px 1px rgba(113, 106, 202, 0.2);
            will-change: opacity, transform;
            transition: all 0.3s ease-out;
            -webkit-transition: all 0.3s ease-out;
            border-radius: 4px;
            border: transparent;
            outline: none;
        }

        .form-control-file::-ms-file-upload-button {
            letter-spacing: 1px;
            padding: 9px 20px;
            text-shadow: none;
            font-size: 14px;
            color: #fff;
            font-weight: normal;
            white-space: normal;
            word-wrap: break-word;
            transition: 0.2s ease-out;
            touch-action: manipulation;
            cursor: pointer;
            background-color: #805dca;
            box-shadow: 0px 0px 15px 1px rgba(113, 106, 202, 0.2);
            will-change: opacity, transform;
            transition: all 0.3s ease-out;
            -webkit-transition: all 0.3s ease-out;
            border-radius: 4px;
            border: transparent;
            outline: none;
        }

        .form-control-file.form-control-file-rounded::-webkit-file-upload-button {
            -webkit-border-radius: 1.875rem !important;
            -moz-border-radius: 1.875rem !important;
            -ms-border-radius: 1.875rem !important;
            -o-border-radius: 1.875rem !important;
            border-radius: 1.875rem !important;
        }

        select.form-control.form-custom {
            display: inline-block;
            width: 100%;
            height: calc(2.25rem + 2px);
            vertical-align: middle;
            background: #fff url(../img/arrow-down.png) no-repeat right 0.75rem center;
            background-size: 13px 14px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }


        /*      Form Control Custom File       */

        .file-upload-input {
            padding: 0.375rem 0.75rem;
        }

        .file-upload-input::-webkit-file-upload-button {
            letter-spacing: 1px;
            padding: 9px 20px;
            text-shadow: none;
            font-size: 12px;
            color: #1b2e4b;
            font-weight: normal;
            white-space: normal;
            word-wrap: break-word;
            transition: 0.2s ease-out;
            touch-action: manipulation;
            cursor: pointer;
            background-color: #e0e6ed;
            will-change: opacity, transform;
            transition: all 0.3s ease-out;
            -webkit-transition: all 0.3s ease-out;
            border: transparent;
            outline: none;
        }

        .file-upload-input::-webkit-file-upload-button:hover {
            background-color: #e0e6ed;
        }

        .file-upload-input.form-control-file-rounded::-webkit-file-upload-button {
            -webkit-border-radius: 1.875rem !important;
            -moz-border-radius: 1.875rem !important;
            -ms-border-radius: 1.875rem !important;
            -o-border-radius: 1.875rem !important;
            border-radius: 1.875rem !important;
        }

        .form-control[type=file]::file-selector-button,
        .form-control[type=file]::-webkit-file-upload-button {
            background-color: #e0e6ed !important;
            color: #1b2e4b;
        }


        /*      Input Group      */

        .input-group button:hover,
        .input-group .btn:hover,
        .input-group button:focus,
        .input-group .btn:focus {
            transform: none;
        }

        .input-group .dropdown-menu {
            border: none;
            z-index: 1028;
            box-shadow: none;
            padding: 10px;
            padding: 0.35rem 0;
            right: auto;
            border-radius: 8px;
            box-shadow: none;
            background-color: #fff;
            border: 1px solid #e0e6ed;
        }

        .input-group .dropdown-menu a.dropdown-item {
            border-radius: 5px;
            width: 100%;
            padding: 6px 17px;
            clear: both;
            font-weight: 500;
            color: #0e1726;
            text-align: inherit;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
            font-size: 13px;
        }

        .input-group .dropdown-menu a.dropdown-item:hover {
            color: #2196f3;
        }

        .input-group .dropdown-menu .dropdown-item:hover {
            color: #2196f3;
        }

        .input-group .dropdown-divider {
            height: 0;
            margin: 0.5rem 0;
            overflow: hidden;
            border-top: 1px solid #e0e6ed;
        }

        .input-group .input-group-text {
            border: 1px solid #bfc9d4;
            background-color: #f1f2f3;
            color: #515365;
        }

        .input-group .input-group-text svg {
            color: #515365;
        }

        .input-group:hover .input-group-text svg {
            color: #4361ee;
            fill: rgba(27, 85, 226, 0.2392156863);
        }

        .input-group .input-group-append .input-group-text {
            border: 1px solid #bfc9d4;
            background-color: #f1f2f3;
            color: #515365;
        }

        .input-group .input-group-append .input-group-text svg {
            color: #888ea8;
        }

        .input-group:hover .input-group-append .input-group-text svg {
            color: #4361ee;
            fill: rgba(27, 85, 226, 0.2392156863);
        }


        /*      Input Group append       */


        /*      Input Group Append       */


        /*      Validation Customization      */

        .invalid-feedback {
            color: #e7515a;
            font-size: 13px;
            letter-spacing: 1px;
        }

        .valid-feedback {
            color: #009688;
            font-size: 13px;
            letter-spacing: 1px;
        }

        .valid-tooltip {
            background-color: #009688;
        }

        .invalid-tooltip {
            background-color: #e7515a;
        }

        .custom-select.is-valid,
        .form-control.is-valid {
            border-color: #009688;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23009688' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpolyline points='20 6 9 17 4 12'%3e%3c/polyline%3e%3c/svg%3e");
        }

        .was-validated .custom-select:valid,
        .was-validated .form-control:valid {
            border-color: #009688;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23009688' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3e%3cpolyline points='20 6 9 17 4 12'%3e%3c/polyline%3e%3c/svg%3e");
        }

        .custom-control-input.is-valid~.custom-control-label,
        .was-validated .custom-control-input:valid~.custom-control-label {
            color: #009688;
        }

        .form-control.is-invalid,
        .was-validated .form-control:invalid {
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23e7515a' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-x'%3e%3cline x1='18' y1='6' x2='6' y2='18'%3e%3c/line%3e%3cline x1='6' y1='6' x2='18' y2='18'%3e%3c/line%3e%3c/svg%3e");
        }

        .custom-control-input.is-invalid~.custom-control-label,
        .was-validated .custom-control-input:invalid~.custom-control-label {
            color: #e7515a;
        }

        .dropdown-toggle:after,
        .dropup .dropdown-toggle::after,
        .dropend .dropdown-toggle::after,
        .dropstart .dropdown-toggle::before {
            display: none;
        }

        .dropdown-toggle svg.feather[class*=feather-chevron-] {
            width: 15px;
            height: 15px;
            vertical-align: middle;
        }

        .btn {
            padding: 0.4375rem 1.25rem;
            text-shadow: none;
            font-size: 14px;
            color: #3b3f5c;
            font-weight: normal;
            white-space: normal;
            word-wrap: break-word;
            transition: 0.2s ease-out;
            touch-action: manipulation;
            border-radius: 6px;
            cursor: pointer;
            background-color: #e0e6ed;
            will-change: opacity, transform;
            transition: all 0.3s ease-out;
            -webkit-transition: all 0.3s ease-out;
        }

        .btn svg {
            pointer-events: none;
            height: 22px;
            width: 22px;
            vertical-align: middle;
        }

        .btn .btn-text-inner {
            margin-left: 3px;
            vertical-align: middle;
            pointer-events: none;
        }

        .btn.btn-icon {
            padding: 7.5px 9px;
        }

        .btn.btn-icon.btn-rounded {
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -ms-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%;
        }

        .btn.rounded-circle {
            height: 40px;
            width: 40px;
            padding: 8px 8px;
        }

        .btn:hover {
            color: #3b3f5c;
            background-color: #f1f2f3;
            border-color: #d3d3d3;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            -webkit-transform: translateY(-3px);
            transform: translateY(-3px);
        }

        .btn-group .btn:hover,
        .btn-group .btn:focus {
            -webkit-transform: none;
            transform: none;
        }

        .btn.disabled,
        .btn.btn[disabled] {
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn.disabled:hover,
        .btn.btn[disabled]:hover {
            cursor: not-allowed;
        }

        .btn .caret {
            border-top-color: #0e1726;
            margin-top: 0;
            margin-left: 3px;
            vertical-align: middle;
        }

        .btn+.caret,
        .btn+.dropdown-toggle .caret {
            margin-left: 0;
        }

        .btn-group>.btn,
        .btn-group .btn {
            padding: 8px 14px;
        }

        .btn-group-lg>.btn,
        .btn-group-lg .btn {
            font-size: 1.125rem;
        }

        .btn-group-lg>.btn {
            padding: 0.625rem 1.5rem;
            font-size: 16px;
        }

        .btn-lg {
            padding: 0.625rem 1.5rem;
            font-size: 16px;
        }

        .btn-group>.btn.btn-lg,
        .btn-group .btn.btn-lg {
            padding: 0.625rem 1.5rem;
            font-size: 16px;
        }

        .btn-group-lg>.btn,
        .btn-group-lg .btn {
            font-size: 1.125rem;
        }

        .btn-group-sm>.btn,
        .btn-sm {
            font-size: 0.6875rem;
        }

        .btn-group>.btn.btn-sm,
        .btn-group .btn.btn-sm {
            font-size: 0.6875rem;
        }

        .btn-group .dropdown-menu {
            border: none;
            z-index: 1028;
            box-shadow: none;
            padding: 10px;
            padding: 0.35rem 0;
            right: auto;
            border-radius: 8px;
            background-color: #fff;
            border: 1px solid #e0e6ed;
        }

        .btn-group .dropdown-menu a.dropdown-item {
            border-radius: 5px;
            width: 100%;
            padding: 6px 17px;
            clear: both;
            font-weight: 500;
            color: #0e1726;
            text-align: inherit;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
            font-size: 13px;
        }

        .dropdown-divider {
            border-top: 1px solid #e0e6ed;
        }

        .btn-group .dropdown-menu a.dropdown-item:hover {
            color: #2196f3;
        }

        .btn-group .dropdown-menu a.dropdown-item svg {
            cursor: pointer;
            color: #888ea8;
            margin-right: 6px;
            vertical-align: middle;
            width: 20px;
            height: 20px;
            fill: rgba(0, 23, 55, 0.08);
        }

        .btn-group .dropdown-menu a.dropdown-item:hover svg {
            color: #4361ee;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu {
            border: 1px solid #e0e6ed;
            z-index: 899;
            box-shadow: none;
            padding: 10px;
            padding: 0.35rem 0;
            transition: top 0.3s ease-in-out 0s, opacity 0.3s ease-in-out 0s, visibility 0.3s ease-in-out 0s;
            opacity: 0;
            visibility: hidden;
            display: block !important;
            transform: none !important;
            top: 0 !important;
            border-radius: 8px;
            background: #fff;
            box-shadow: none;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu.right {
            right: auto;
            left: auto !important;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu.left {
            inset: 0 0 auto auto !important;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu.show {
            opacity: 1;
            visibility: visible;
            top: 21px !important;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu a.dropdown-item {
            border-radius: 5px;
            display: block;
            width: 100%;
            padding: 6px 17px;
            clear: both;
            font-weight: 500;
            color: #0e1726;
            text-align: inherit;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
            font-size: 13px;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu a.dropdown-item svg {
            width: 18px;
            height: 18px;
            margin-right: 4px;
            vertical-align: bottom;
            color: #888ea8;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu a.dropdown-item:hover svg {
            color: #2196f3;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu a.dropdown-item.active,
        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu a.dropdown-item:active {
            background-color: transparent;
            color: #4361ee;
            font-weight: 700;
        }

        .dropdown:not(.custom-dropdown-icon):not(.custom-dropdown) .dropdown-menu a.dropdown-item:hover {
            color: #2196f3;
            background: rgb(248, 248, 248);
        }

        .btn-primary:not(:disabled):not(.disabled).active:focus,
        .btn-primary:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-primary.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-secondary:not(:disabled):not(.disabled).active:focus,
        .btn-secondary:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-secondary.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-success:not(:disabled):not(.disabled).active:focus,
        .btn-success:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-success.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-info:not(:disabled):not(.disabled).active:focus,
        .btn-info:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-info.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-danger:not(:disabled):not(.disabled).active:focus,
        .btn-danger:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-danger.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-warning:not(:disabled):not(.disabled).active:focus,
        .btn-warning:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-warning.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-secondary:not(:disabled):not(.disabled).active:focus,
        .btn-secondary:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-secondary.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-dark:not(:disabled):not(.disabled).active:focus,
        .btn-dark:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-dark.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-outline-primary:not(:disabled):not(.disabled).active:focus,
        .btn-outline-primary:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-outline-primary.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-outline-success:not(:disabled):not(.disabled).active:focus,
        .btn-outline-success:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-outline-success.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-outline-info:not(:disabled):not(.disabled).active:focus,
        .btn-outline-info:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-outline-info.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-outline-danger:not(:disabled):not(.disabled).active:focus,
        .btn-outline-danger:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-outline-danger.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-outline-warning:not(:disabled):not(.disabled).active:focus,
        .btn-outline-warning:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-outline-warning.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-outline-secondary:not(:disabled):not(.disabled).active:focus,
        .btn-outline-secondary:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-outline-secondary.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn-outline-dark:not(:disabled):not(.disabled).active:focus,
        .btn-outline-dark:not(:disabled):not(.disabled):active:focus {
            box-shadow: none;
        }

        .show>.btn-outline-dark.dropdown-toggle:focus {
            box-shadow: none;
        }

        .btn.focus,
        .btn:focus {
            box-shadow: none;
        }

        .btn-success:focus,
        .btn-info:focus,
        .btn-danger:focus,
        .btn-warning:focus,
        .btn-secondary:focus,
        .btn-dark:focus,
        .btn-outline-success:focus,
        .btn-outline-info:focus,
        .btn-outline-danger:focus,
        .btn-outline-warning:focus,
        .btn-outline-secondary:focus,
        .btn-outline-dark:focus .btn-light-default:focus,
        .btn-light-primary:focus,
        .btn-light-success:focus,
        .btn-light-info:focus,
        .btn-light-danger:focus,
        .btn-light-warning:focus,
        .btn-light-secondary:focus,
        .btn-light-dark:focus {
            box-shadow: none;
        }


        /*      Default Buttons       */

        .btn-primary {
            color: #fff !important;
            background-color: #4361ee !important;
            border-color: #4361ee;
            box-shadow: 0 10px 20px -10px rgba(27, 85, 226, 0.59);
        }

        .btn-primary:hover,
        .btn-primary:focus {
            color: #fff !important;
            background-color: #4361ee !important;
            box-shadow: none;
            border-color: #4361ee !important;
        }

        .btn-primary:active,
        .btn-primary.active {
            background-color: #4361ee;
            border-top: 1px solid #4361ee;
        }

        .btn-primary.disabled,
        .btn-primary.btn[disabled],
        .btn-primary:disabled {
            background-color: #4361ee;
            border-color: #4361ee;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-primary.active.focus,
        .btn-primary.active:focus,
        .btn-primary.active:hover {
            color: #fff !important;
            background-color: #2aebcb;
            border-color: #2aebcb;
        }

        .btn-primary.focus:active {
            color: #fff !important;
            background-color: #2aebcb;
            border-color: #2aebcb;
        }

        .btn-primary:active:focus,
        .btn-primary:active:hover {
            color: #fff !important;
            background-color: #2aebcb;
            border-color: #2aebcb;
        }

        .btn-primary:first-child:hover {
            color: #fff;
            background-color: #2e46b6;
            border-color: #2e46b6;
        }

        .open>.dropdown-toggle.btn-primary.focus,
        .open>.dropdown-toggle.btn-primary:focus,
        .open>.dropdown-toggle.btn-primary:hover {
            color: #fff !important;
            background-color: #2aebcb;
            border-color: #2aebcb;
        }

        .btn-primary:not(:disabled):not(.disabled).active,
        .btn-primary:not(:disabled):not(.disabled):active {
            color: #fff !important;
            background-color: #4361ee;
            border-color: #4361ee;
        }

        .show>.btn-primary.dropdown-toggle {
            color: #fff !important;
            background-color: #4361ee;
            border-color: #4361ee;
        }

        .btn-primary .caret {
            border-top-color: #fff;
        }

        .btn-group.open .btn-primary.dropdown-toggle {
            background-color: #bfc1fb;
        }

        .btn-secondary {
            color: #fff !important;
            background-color: #805dca;
            border-color: #805dca;
            box-shadow: 0 10px 20px -10px rgba(92, 26, 195, 0.59);
        }

        .btn-secondary:hover,
        .btn-secondary:focus {
            color: #fff !important;
            background-color: #805dca !important;
            box-shadow: none;
            border-color: #805dca !important;
        }

        .btn-secondary:active,
        .btn-secondary.active {
            background-color: #805dca;
            border-top: 1px solid #805dca;
        }

        .btn-secondary:not(:disabled):not(.disabled).active,
        .btn-secondary:not(:disabled):not(.disabled):active {
            color: #fff !important;
            background-color: #805dca;
            border-color: #805dca;
        }

        .show>.btn-secondary.dropdown-toggle {
            color: #fff !important;
            background-color: #805dca;
            border-color: #805dca;
        }

        .btn-secondary.disabled,
        .btn-secondary.btn[disabled],
        .btn-secondary:disabled {
            background-color: #805dca;
            border-color: #805dca;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-secondary .caret {
            border-top-color: #fff;
        }

        .btn-info {
            color: #fff !important;
            background-color: #2196f3;
            border-color: #2196f3;
            box-shadow: 0 10px 20px -10px rgba(33, 150, 243, 0.59);
        }

        .btn-info:hover,
        .btn-info:focus {
            color: #fff !important;
            background-color: #2196f3 !important;
            box-shadow: none;
            border-color: #2196f3 !important;
        }

        .btn-info:active,
        .btn-info.active {
            background-color: #2196f3;
            border-top: 1px solid #2196f3;
        }

        .btn-info:not(:disabled):not(.disabled).active,
        .btn-info:not(:disabled):not(.disabled):active {
            color: #fff !important;
            background-color: #2196f3;
            border-color: #2196f3;
        }

        .show>.btn-info.dropdown-toggle {
            color: #fff !important;
            background-color: #2196f3;
            border-color: #2196f3;
        }

        .btn-info.disabled,
        .btn-info.btn[disabled],
        .btn-info:disabled {
            background-color: #2196f3;
            border-color: #2196f3;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn.disabled,
        .btn:disabled {
            opacity: 0.35;
        }

        fieldset:disabled .btn {
            opacity: 0.35;
        }

        .btn-info.active.focus,
        .btn-info.active:focus,
        .btn-info.active:hover {
            color: #fff !important;
            background-color: #2196f3;
            border-color: #2196f3;
        }

        .btn-info.focus:active {
            color: #fff !important;
            background-color: #2196f3;
            border-color: #2196f3;
        }

        .btn-info:active:focus,
        .btn-info:active:hover {
            color: #fff !important;
            background-color: #2196f3;
            border-color: #2196f3;
        }

        .open>.dropdown-toggle.btn-info.focus,
        .open>.dropdown-toggle.btn-info:focus,
        .open>.dropdown-toggle.btn-info:hover {
            color: #fff !important;
            background-color: #2196f3;
            border-color: #2196f3;
        }

        .btn-info .caret {
            border-top-color: #fff;
        }

        .btn-group.open .btn-info.dropdown-toggle {
            background-color: #a6d5fa;
        }

        .btn-warning {
            color: #fff !important;
            background-color: #e2a03f;
            border-color: #e2a03f;
            box-shadow: 0 10px 20px -10px rgba(226, 160, 63, 0.59);
        }

        .btn-warning:hover,
        .btn-warning:focus {
            color: #fff !important;
            background-color: #e2a03f !important;
            box-shadow: none;
            border-color: #e2a03f !important;
        }

        .btn-warning:active,
        .btn-warning.active {
            background-color: #e2a03f;
            border-top: 1px solid #e2a03f;
        }

        .btn-warning:not(:disabled):not(.disabled).active,
        .btn-warning:not(:disabled):not(.disabled):active {
            color: #0e1726;
            background-color: #e2a03f;
            border-color: #e2a03f;
        }

        .show>.btn-warning.dropdown-toggle {
            color: #0e1726;
            background-color: #e2a03f;
            border-color: #e2a03f;
        }

        .btn-warning.disabled,
        .btn-warning.btn[disabled],
        .btn-warning:disabled {
            background-color: #e2a03f;
            border-color: #e2a03f;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-warning.active.focus,
        .btn-warning.active:focus,
        .btn-warning.active:hover {
            color: #fff !important;
            background-color: #e2a03f;
            border-color: #e2a03f;
        }

        .btn-warning.focus:active {
            color: #fff !important;
            background-color: #e2a03f;
            border-color: #e2a03f;
        }

        .btn-warning:active:focus,
        .btn-warning:active:hover {
            color: #fff !important;
            background-color: #e2a03f;
            border-color: #e2a03f;
        }

        .open>.dropdown-toggle.btn-warning.focus,
        .open>.dropdown-toggle.btn-warning:focus,
        .open>.dropdown-toggle.btn-warning:hover {
            color: #fff !important;
            background-color: #e2a03f;
            border-color: #e2a03f;
        }

        .btn-warning .caret {
            border-top-color: #fff;
        }

        .btn-group.open .btn-warning.dropdown-toggle {
            background-color: #df8505;
        }

        .btn-danger {
            color: #fff !important;
            background-color: #e7515a;
            border-color: #e7515a;
            box-shadow: 0 10px 20px -10px rgba(231, 81, 90, 0.59);
        }

        .btn-danger:hover,
        .btn-danger:focus {
            color: #fff !important;
            background-color: #e7515a !important;
            box-shadow: none;
            border-color: #e7515a !important;
        }

        .btn-danger:active,
        .btn-danger.active {
            background-color: #e7515a;
            border-top: 1px solid #e7515a;
        }

        .btn-danger:not(:disabled):not(.disabled).active,
        .btn-danger:not(:disabled):not(.disabled):active {
            color: #fff !important;
            background-color: #e7515a;
            border-color: #e7515a;
        }

        .show>.btn-danger.dropdown-toggle {
            color: #fff !important;
            background-color: #e7515a;
            border-color: #e7515a;
        }

        .btn-danger.disabled,
        .btn-danger.btn[disabled],
        .btn-danger:disabled {
            background-color: #e7515a;
            border-color: #e7515a;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-danger.active.focus,
        .btn-danger.active:focus,
        .btn-danger.active:hover {
            color: #fff !important;
            background-color: #c00;
            border-color: #c00;
        }

        .btn-danger.focus:active {
            color: #fff !important;
            background-color: #c00;
            border-color: #c00;
        }

        .btn-danger:active:focus,
        .btn-danger:active:hover {
            color: #fff !important;
            background-color: #c00;
            border-color: #c00;
        }

        .open>.dropdown-toggle.btn-danger.focus,
        .open>.dropdown-toggle.btn-danger:focus,
        .open>.dropdown-toggle.btn-danger:hover {
            color: #fff !important;
            background-color: #c00;
            border-color: #c00;
        }

        .btn-danger .caret {
            border-top-color: #fff;
        }

        .btn-group.open .btn-danger.dropdown-toggle {
            background-color: #a9302a;
        }

        .btn-dark {
            color: #fff !important;
            background-color: #3b3f5c;
            border-color: #3b3f5c;
            box-shadow: 0 10px 20px -10px rgba(59, 63, 92, 0.59);
        }

        .btn-dark:hover,
        .btn-dark:focus {
            color: #fff !important;
            background-color: #3b3f5c !important;
            box-shadow: none;
            border-color: #3b3f5c !important;
        }

        .btn-dark:active,
        .btn-dark.active {
            background-color: #3b3f5c;
            border-top: 1px solid #3b3f5c;
        }

        .btn-dark:not(:disabled):not(.disabled).active,
        .btn-dark:not(:disabled):not(.disabled):active {
            color: #fff !important;
            background-color: #3b3f5c;
            border-color: #3b3f5c;
        }

        .show>.btn-dark.dropdown-toggle {
            color: #fff !important;
            background-color: #3b3f5c;
            border-color: #3b3f5c;
        }

        .btn-dark.disabled,
        .btn-dark.btn[disabled],
        .btn-dark:disabled {
            background-color: #3b3f5c;
            border-color: #3b3f5c;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-dark .caret {
            border-top-color: #fff;
        }

        .btn-group.open .btn-dark.dropdown-toggle {
            background-color: #484848;
        }

        .btn-success {
            color: #fff !important;
            background-color: #00ab55;
            border-color: #00ab55;
            box-shadow: 0 10px 20px -10px rgba(0, 171, 85, 0.59);
        }

        .btn-success:hover,
        .btn-success:focus {
            color: #fff !important;
            background-color: #00ab55 !important;
            box-shadow: none;
            border-color: #00ab55 !important;
        }

        .btn-success:active,
        .btn-success.active {
            background-color: #00ab55;
            border-top: 1px solid #00ab55;
        }

        .btn-success:not(:disabled):not(.disabled).active,
        .btn-success:not(:disabled):not(.disabled):active {
            color: #fff !important;
            background-color: #00ab55;
            border-color: #00ab55;
        }

        .show>.btn-success.dropdown-toggle {
            color: #fff !important;
            background-color: #00ab55;
            border-color: #00ab55;
        }

        .btn-success.disabled,
        .btn-success.btn[disabled],
        .btn-success:disabled {
            background-color: #00ab55;
            border-color: #00ab55;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-success.active.focus,
        .btn-success.active:focus,
        .btn-success.active:hover {
            color: #fff !important;
            background-color: #17c678;
            border-color: #17c678;
        }

        .btn-success.focus:active {
            color: #fff !important;
            background-color: #17c678;
            border-color: #17c678;
        }

        .btn-success:active:focus,
        .btn-success:active:hover {
            color: #fff !important;
            background-color: #17c678;
            border-color: #17c678;
        }

        .open>.dropdown-toggle.btn-success.focus,
        .open>.dropdown-toggle.btn-success:focus,
        .open>.dropdown-toggle.btn-success:hover {
            color: #fff !important;
            background-color: #17c678;
            border-color: #17c678;
        }

        .btn-success .caret {
            border-top-color: #fff;
        }

        .btn.box-shadow-none {
            border: none;
        }

        .btn.box-shadow-none:hover,
        .btn.box-shadow-none:focus {
            border: none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            background-color: transparent;
        }

        .box-shadow-none {
            -webkit-box-shadow: none !important;
            -moz-box-shadow: none !important;
            box-shadow: none !important;
        }

        .btn.box-shadow-none:not(:disabled):not(.disabled).active,
        .btn.box-shadow-none:not(:disabled):not(.disabled):active {
            border: none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            background-color: transparent;
        }

        .show>.btn.box-shadow-none.dropdown-toggle {
            border: none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            background-color: transparent;
        }

        .btn-group.open .btn-success.dropdown-toggle {
            background-color: #499249;
        }

        .btn-dismiss {
            color: #0e1726;
            background-color: #fff !important;
            border-color: #fff;
            padding: 3px 7px;
        }

        .btn-dismiss:hover,
        .btn-dismiss:focus {
            color: #0e1726;
            background-color: #fff;
        }

        .btn-dismiss:active,
        .btn-dismiss.active {
            background-color: #fff;
            border-top: 1px solid #fff;
        }

        .btn-group>.btn i {
            margin-right: 3px;
        }

        .btn-group>.btn:first-child:not(:last-child):not(.dropdown-toggle) {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .btn-group>.btn+.dropdown-toggle {
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }

        .btn-group-vertical>.btn-check:checked+.btn,
        .btn-group-vertical>.btn-check:focus+.btn {
            -webkit-transform: none;
            transform: none;
            transition: 0.1s;
        }

        .btn-group-vertical>.btn.active,
        .btn-group-vertical>.btn:active,
        .btn-group-vertical>.btn:focus,
        .btn-group-vertical>.btn:hover {
            -webkit-transform: none;
            transform: none;
            transition: 0.1s;
        }

        .btn-group>.btn-check:checked+.btn,
        .btn-group>.btn-check:focus+.btn {
            -webkit-transform: none;
            transform: none;
            transition: 0.1s;
        }

        .btn-group>.btn.active,
        .btn-group>.btn:active,
        .btn-group>.btn:focus,
        .btn-group>.btn:hover {
            -webkit-transform: none;
            transform: none;
            transition: 0.1s;
        }

        .btn-group-vertical>.btn:active {
            box-shadow: none;
        }

        .btn-group>.btn:hover {
            opacity: 0.8;
        }

        .btn-group-vertical>.btn-group:not(:first-child) {
            margin-bottom: 0;
        }

        .btn-group-vertical>.btn:not(:first-child) {
            margin-bottom: 0;
        }

        .btn-group-vertical>.btn:hover {
            opacity: 0.8;
        }


        /*
    Btn group dropdown-toggle
  */

        .btn-group>.btn+.dropdown-toggle.btn-primary {
            border-left: 1px solid rgb(93, 119, 243);
        }

        .btn-group>.btn+.dropdown-toggle.btn-success {
            border-left: 1px solid rgb(74, 203, 138);
        }

        .btn-group>.btn+.dropdown-toggle.btn-info {
            border-left: 1px solid rgb(73, 172, 251);
        }

        .btn-group>.btn+.dropdown-toggle.btn-warning {
            border-left: 1px solid rgb(245, 180, 85);
        }

        .btn-group>.btn+.dropdown-toggle.btn-danger {
            border-left: 1px solid rgb(241, 132, 139);
        }

        .btn-group>.btn+.dropdown-toggle.btn-dark {
            border-left: 1px solid rgb(74, 78, 106);
        }

        .btn-group>.btn+.dropdown-toggle.btn-secondary {
            border-left: 1px solid rgb(149, 112, 227);
        }

        .btn-group.dropstart .dropdown-toggle-split {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .btn-group.dropstart .btn-primary:not(.dropdown-toggle-split) {
            border-left: 1px solid rgb(68, 104, 253);
        }

        .btn-group.dropstart .btn-success:not(.dropdown-toggle-split) {
            border-left: 1px solid rgb(163, 198, 111);
        }

        .btn-group.dropstart .btn-info:not(.dropdown-toggle-split) {
            border-left: 1px solid rgb(73, 172, 251);
        }

        .btn-group.dropstart .btn-warning:not(.dropdown-toggle-split) {
            border-left: 1px solid rgb(245, 180, 85);
        }

        .btn-group.dropstart .btn-danger:not(.dropdown-toggle-split) {
            border-left: 1px solid rgb(241, 132, 139);
        }

        .btn-group.dropstart .btn-dark:not(.dropdown-toggle-split) {
            border-left: 1px solid rgb(112, 118, 122);
        }

        .btn-group.dropstart .btn-secondary:not(.dropdown-toggle-split) {
            border-left: 1px solid rgb(131, 83, 220);
        }

        .btn .badge.badge-align-right {
            position: absolute;
            top: -1px;
            right: 8px;
        }

        .dropup .btn .caret {
            border-bottom-color: #0e1726;
        }

        .btn-outline-primary:not(:disabled):not(.disabled).active,
        .btn-outline-primary:not(:disabled):not(.disabled):active {
            background-color: #4361ee;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-primary.dropdown-toggle.show:focus {
            background-color: #4361ee;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-success:not(:disabled):not(.disabled).active,
        .btn-outline-success:not(:disabled):not(.disabled):active {
            background-color: #00ab55;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-success.dropdown-toggle.show:focus {
            background-color: #00ab55;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-info:not(:disabled):not(.disabled).active,
        .btn-outline-info:not(:disabled):not(.disabled):active {
            background-color: #2196f3;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-info.dropdown-toggle.show:focus {
            background-color: #2196f3;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-danger:not(:disabled):not(.disabled).active,
        .btn-outline-danger:not(:disabled):not(.disabled):active {
            background-color: #e7515a;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-danger.dropdown-toggle.show:focus {
            background-color: #e7515a;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-warning:not(:disabled):not(.disabled).active,
        .btn-outline-warning:not(:disabled):not(.disabled):active {
            background-color: #e2a03f;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-warning.dropdown-toggle.show:focus {
            background-color: #e2a03f;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-secondary:not(:disabled):not(.disabled).active,
        .btn-outline-secondary:not(:disabled):not(.disabled):active {
            background-color: #805dca;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-secondary.dropdown-toggle.show:focus {
            background-color: #805dca;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-dark:not(:disabled):not(.disabled).active,
        .btn-outline-dark:not(:disabled):not(.disabled):active {
            background-color: #3b3f5c;
            color: #fff !important;
            box-shadow: none;
        }

        .btn-outline-dark.dropdown-toggle.show:focus {
            background-color: #3b3f5c;
            color: #fff !important;
            box-shadow: none;
        }

        .show>.btn-outline-primary.dropdown-toggle:after,
        .show>.btn-outline-success.dropdown-toggle:after,
        .show>.btn-outline-info.dropdown-toggle:after,
        .show>.btn-outline-danger.dropdown-toggle:after,
        .show>.btn-outline-warning.dropdown-toggle:after,
        .show>.btn-outline-secondary.dropdown-toggle:after,
        .show>.btn-outline-dark.dropdown-toggle:after,
        .show>.btn-outline-primary.dropdown-toggle:before,
        .show>.btn-outline-success.dropdown-toggle:before,
        .show>.btn-outline-info.dropdown-toggle:before,
        .show>.btn-outline-danger.dropdown-toggle:before,
        .show>.btn-outline-warning.dropdown-toggle:before,
        .show>.btn-outline-secondary.dropdown-toggle:before,
        .show>.btn-outline-dark.dropdown-toggle:before {
            color: #fff !important;
        }

        .btn-outline-primary {
            border: 1px solid #4361ee !important;
            color: #4361ee !important;
            background-color: transparent;
            box-shadow: none;
        }

        .btn-outline-info {
            border: 1px solid #2196f3 !important;
            color: #2196f3 !important;
            background-color: transparent;
            box-shadow: none;
        }

        .btn-outline-warning {
            border: 1px solid #e2a03f !important;
            color: #e2a03f !important;
            background-color: transparent;
            box-shadow: none;
        }

        .btn-outline-success {
            border: 1px solid #00ab55 !important;
            color: #00ab55 !important;
            background-color: transparent;
            box-shadow: none;
        }

        .btn-outline-danger {
            border: 1px solid #e7515a !important;
            color: #e7515a !important;
            background-color: transparent;
            box-shadow: none;
        }

        .btn-outline-secondary {
            border: 1px solid #805dca !important;
            color: #805dca !important;
            background-color: transparent;
            box-shadow: none;
        }

        .btn-outline-dark {
            border: 1px solid #3b3f5c !important;
            color: #3b3f5c !important;
            background-color: transparent;
            box-shadow: none;
        }

        .btn-outline-dark.disabled,
        .btn-outline-dark:disabled {
            color: #3b3f5c !important;
        }

        .btn-outline-primary:hover,
        .btn-outline-info:hover,
        .btn-outline-warning:hover,
        .btn-outline-success:hover,
        .btn-outline-danger:hover,
        .btn-outline-secondary:hover,
        .btn-outline-dark:hover {
            box-shadow: 0px 5px 20px 0 rgba(0, 0, 0, 0.1);
        }

        .btn-outline-primary:hover {
            color: #fff !important;
            background-color: #4361ee !important;
            box-shadow: 0 10px 20px -10px rgba(27, 85, 226, 0.59) !important;
        }

        .btn-outline-info:hover {
            color: #fff !important;
            background-color: #2196f3 !important;
            box-shadow: 0 10px 20px -10px rgba(33, 150, 243, 0.588) !important;
        }

        .btn-outline-warning:hover {
            color: #fff !important;
            background-color: #e2a03f !important;
            box-shadow: 0 10px 20px -10px rgba(226, 160, 63, 0.588) !important;
        }

        .btn-outline-success:hover {
            color: #fff !important;
            background-color: #00ab55 !important;
            box-shadow: 0 10px 20px -10px rgba(0, 171, 85, 0.59) !important;
        }

        .btn-outline-danger:hover {
            color: #fff !important;
            background-color: #e7515a !important;
            box-shadow: 0 10px 20px -10px rgba(231, 81, 90, 0.588) !important;
        }

        .btn-outline-secondary:hover {
            color: #fff !important;
            background-color: #805dca !important;
            box-shadow: 0 10px 20px -10px rgba(92, 26, 195, 0.59) !important;
        }

        .btn-outline-dark:hover {
            color: #fff !important;
            background-color: #3b3f5c !important;
            box-shadow: 0 10px 20px -10px rgba(59, 63, 92, 0.59) !important;
        }

        .btn-check:active+.btn-outline-primary,
        .btn-check:checked+.btn-outline-primary {
            background-color: #4361ee !important;
            color: #fff !important;
        }

        .btn-outline-primary.active,
        .btn-outline-primary.dropdown-toggle.show,
        .btn-outline-primary:active {
            background-color: #4361ee !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-outline-info,
        .btn-check:checked+.btn-outline-info {
            background-color: #2196f3 !important;
            color: #fff !important;
        }

        .btn-outline-info.active,
        .btn-outline-info.dropdown-toggle.show,
        .btn-outline-info:active {
            background-color: #2196f3 !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-outline-success,
        .btn-check:checked+.btn-outline-success {
            background-color: #00ab55 !important;
            color: #fff !important;
        }

        .btn-outline-success.active,
        .btn-outline-success.dropdown-toggle.show,
        .btn-outline-success:active {
            background-color: #00ab55 !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-outline-warning,
        .btn-check:checked+.btn-outline-warning {
            background-color: #e2a03f !important;
            color: #fff !important;
        }

        .btn-outline-warning.active,
        .btn-outline-warning.dropdown-toggle.show,
        .btn-outline-warning:active {
            background-color: #e2a03f !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-outline-danger,
        .btn-check:checked+.btn-outline-danger {
            background-color: #e7515a !important;
            color: #fff !important;
        }

        .btn-outline-danger.active,
        .btn-outline-danger.dropdown-toggle.show,
        .btn-outline-danger:active {
            background-color: #e7515a !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-outline-secondary,
        .btn-check:checked+.btn-outline-secondary {
            background-color: #805dca !important;
            color: #fff !important;
        }

        .btn-outline-secondary.active,
        .btn-outline-secondary.dropdown-toggle.show,
        .btn-outline-secondary:active {
            background-color: #805dca !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-outline-dark,
        .btn-check:checked+.btn-outline-dark {
            background-color: #3b3f5c !important;
            color: #fff !important;
        }

        .btn-outline-dark.active,
        .btn-outline-dark.dropdown-toggle.show,
        .btn-outline-dark:active {
            background-color: #3b3f5c !important;
            color: #fff !important;
        }


        /* Primary */

        .btn-check:active+.btn-outline-primary:focus,
        .btn-check:checked+.btn-outline-primary:focus {
            box-shadow: none;
        }

        .btn-outline-primary.active:focus,
        .btn-outline-primary.dropdown-toggle.show:focus,
        .btn-outline-primary:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-outline-primary,
        .btn-outline-primary:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-outline-info:focus,
        .btn-check:checked+.btn-outline-info:focus {
            box-shadow: none;
        }

        .btn-outline-info.active:focus,
        .btn-outline-info.dropdown-toggle.show:focus,
        .btn-outline-info:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-outline-info,
        .btn-outline-info:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-outline-success:focus,
        .btn-check:checked+.btn-outline-success:focus {
            box-shadow: none;
        }

        .btn-outline-success.active:focus,
        .btn-outline-success.dropdown-toggle.show:focus,
        .btn-outline-success:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-outline-success,
        .btn-outline-success:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-outline-danger:focus,
        .btn-check:checked+.btn-outline-danger:focus {
            box-shadow: none;
        }

        .btn-outline-danger.active:focus,
        .btn-outline-danger.dropdown-toggle.show:focus,
        .btn-outline-danger:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-outline-danger,
        .btn-outline-danger:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-outline-secondary:focus,
        .btn-check:checked+.btn-outline-secondary:focus {
            box-shadow: none;
        }

        .btn-outline-secondary.active:focus,
        .btn-outline-secondary.dropdown-toggle.show:focus,
        .btn-outline-secondary:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-outline-secondary,
        .btn-outline-secondary:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-outline-warning:focus,
        .btn-check:checked+.btn-outline-warning:focus {
            box-shadow: none;
        }

        .btn-outline-warning.active:focus,
        .btn-outline-warning.dropdown-toggle.show:focus,
        .btn-outline-warning:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-outline-warning,
        .btn-outline-warning:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-outline-dark:focus,
        .btn-check:checked+.btn-outline-dark:focus {
            box-shadow: none;
        }

        .btn-outline-dark.active:focus,
        .btn-outline-dark.dropdown-toggle.show:focus,
        .btn-outline-dark:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-outline-dark,
        .btn-outline-dark:focus {
            box-shadow: none;
        }


        /* Light Buttons  */

        [class*=btn-light-] {
            box-shadow: none;
        }

        .btn-light-primary {
            color: #4361ee;
            background-color: #eceffe;
            border: 1px solid #eceffe;
        }

        .btn-light-primary:hover {
            background-color: #eceffe !important;
            border: 1px solid #eceffe !important;
            color: #4361ee !important;
        }

        .btn-light-info {
            color: #2196f3;
            background-color: #e6f4ff;
            border: 1px solid #e6f4ff;
        }

        .btn-light-info:hover {
            background-color: #e6f4ff !important;
            border: 1px solid #e6f4ff !important;
            color: #2196f3 !important;
        }

        .btn-light-warning {
            color: #eab764;
            background-color: #fcf5e9;
            border: 1px solid #fcf5e9;
        }

        .btn-light-warning:hover {
            background-color: #fcf5e9 !important;
            border: 1px solid #fcf5e9 !important;
            color: #eab764 !important;
        }

        .btn-light-success {
            color: #00ab55;
            background-color: #ddf5f0;
            border: 1px solid #ddf5f0;
        }

        .btn-light-success:hover {
            background-color: #ddf5f0 !important;
            border: 1px solid #ddf5f0 !important;
            color: #00ab55 !important;
        }

        .btn-light-danger {
            color: #e7515a;
            background-color: #fbeced;
            border: 1px solid #fbeced;
        }

        .btn-light-danger:hover {
            background-color: #fbeced !important;
            border: 1px solid #fbeced !important;
            color: #e7515a !important;
        }

        .btn-light-secondary {
            color: #805dca;
            background-color: #f2eafa;
            border: 1px solid #f2eafa;
        }

        .btn-light-secondary:hover {
            background-color: #f2eafa !important;
            border: 1px solid #f2eafa !important;
            color: #805dca !important;
        }

        .btn-light-dark {
            color: #3b3f5c;
            background-color: #eaeaec;
            border: 1px solid #eaeaec;
        }

        .btn-light-dark:hover {
            background-color: #eaeaec !important;
            border: 1px solid #eaeaec !important;
            color: #3b3f5c !important;
        }

        .btn-check:active+.btn-light-primary,
        .btn-check:checked+.btn-light-primary {
            background-color: #4361ee !important;
            color: #fff !important;
        }

        .btn-light-primary.dropdown-toggle.show {
            background-color: #4361ee !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-light-info,
        .btn-check:checked+.btn-light-info {
            background-color: #2196f3 !important;
            color: #fff !important;
        }

        .btn-light-info.dropdown-toggle.show {
            background-color: #2196f3 !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-light-success,
        .btn-check:checked+.btn-light-success {
            background-color: #00ab55 !important;
            color: #fff !important;
        }

        .btn-light-success.dropdown-toggle.show {
            background-color: #00ab55 !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-light-warning,
        .btn-check:checked+.btn-light-warning {
            background-color: #e2a03f !important;
            color: #fff !important;
        }

        .btn-light-warning.dropdown-toggle.show {
            background-color: #e2a03f !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-light-danger,
        .btn-check:checked+.btn-light-danger {
            background-color: #e7515a !important;
            color: #fff !important;
        }

        .btn-light-danger.dropdown-toggle.show {
            background-color: #e7515a !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-light-secondary,
        .btn-check:checked+.btn-light-secondary {
            background-color: #805dca !important;
            color: #fff !important;
        }

        .btn-light-secondary.dropdown-toggle.show {
            background-color: #805dca !important;
            color: #fff !important;
        }

        .btn-check:active+.btn-light-dark,
        .btn-check:checked+.btn-light-dark {
            background-color: #3b3f5c !important;
            color: #fff !important;
        }

        .btn-light-dark.dropdown-toggle.show {
            background-color: #3b3f5c !important;
            color: #fff !important;
        }


        /* Primary */

        .btn-check:active+.btn-light-primary:focus,
        .btn-check:checked+.btn-light-primary:focus {
            box-shadow: none;
        }

        .btn-light-primary.active:focus,
        .btn-light-primary.dropdown-toggle.show:focus,
        .btn-light-primary:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-light-primary,
        .btn-light-primary:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-light-info:focus,
        .btn-check:checked+.btn-light-info:focus {
            box-shadow: none;
        }

        .btn-light-info.active:focus,
        .btn-light-info.dropdown-toggle.show:focus,
        .btn-light-info:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-light-info,
        .btn-light-info:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-light-success:focus,
        .btn-check:checked+.btn-light-success:focus {
            box-shadow: none;
        }

        .btn-light-success.active:focus,
        .btn-light-success.dropdown-toggle.show:focus,
        .btn-light-success:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-light-success,
        .btn-light-success:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-light-danger:focus,
        .btn-check:checked+.btn-light-danger:focus {
            box-shadow: none;
        }

        .btn-light-danger.active:focus,
        .btn-light-danger.dropdown-toggle.show:focus,
        .btn-light-danger:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-light-danger,
        .btn-light-danger:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-light-secondary:focus,
        .btn-check:checked+.btn-light-secondary:focus {
            box-shadow: none;
        }

        .btn-light-secondary.active:focus,
        .btn-light-secondary.dropdown-toggle.show:focus,
        .btn-light-secondary:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-light-secondary,
        .btn-light-secondary:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-light-warning:focus,
        .btn-check:checked+.btn-light-warning:focus {
            box-shadow: none;
        }

        .btn-light-warning.active:focus,
        .btn-light-warning.dropdown-toggle.show:focus,
        .btn-light-warning:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-light-warning,
        .btn-light-warning:focus {
            box-shadow: none;
        }

        .btn-check:active+.btn-light-dark:focus,
        .btn-check:checked+.btn-light-dark:focus {
            box-shadow: none;
        }

        .btn-light-dark.active:focus,
        .btn-light-dark.dropdown-toggle.show:focus,
        .btn-light-dark:active:focus {
            box-shadow: none;
        }

        .btn-check:focus+.btn-light-dark,
        .btn-light-dark:focus {
            box-shadow: none;
        }


        /*      Dropdown Toggle       */

        .btn-rounded {
            -webkit-border-radius: 1.875rem;
            -moz-border-radius: 1.875rem;
            -ms-border-radius: 1.875rem;
            -o-border-radius: 1.875rem;
            border-radius: 1.875rem;
        }


        /*
    ===========================
        Checkboxes and Radio
    ===========================
  */

        .form-check.form-check-primary .form-check-input:checked {
            background-color: #4361ee;
            border-color: #4361ee;
        }

        .form-check.form-check-success .form-check-input:checked {
            background-color: #00ab55;
            border-color: #00ab55;
        }

        .form-check.form-check-danger .form-check-input:checked {
            background-color: #e7515a;
            border-color: #e7515a;
        }

        .form-check.form-check-secondary .form-check-input:checked {
            background-color: #805dca;
            border-color: #805dca;
        }

        .form-check.form-check-warning .form-check-input:checked {
            background-color: #e2a03f;
            border-color: #e2a03f;
        }

        .form-check.form-check-info .form-check-input:checked {
            background-color: #2196f3;
            border-color: #2196f3;
        }

        .form-check.form-check-dark .form-check-input:checked {
            background-color: #3b3f5c;
            border-color: #3b3f5c;
        }


        /*
    =================
        Switches
    =================
  */

        .form-switch .form-check-input {
            /* width: 2em; */
            width: 35px;
            height: 18px;
        }

        .form-switch .form-check-input:focus {
            border-color: transparent;
        }

        .form-switch .form-check-input:not(:checked):focus {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='3' fill='rgba%280, 0, 0, 0.25%29'/%3e%3c/svg%3e");
        }

        .form-switch .form-check-label {
            margin-left: 8px;
            vertical-align: text-top;
        }

        .form-switch.form-switch-primary .form-check-input:checked {
            background-color: #4361ee;
            border-color: #4361ee;
        }

        .form-switch.form-switch-success .form-check-input:checked {
            background-color: #00ab55;
            border-color: #00ab55;
        }

        .form-switch.form-switch-danger .form-check-input:checked {
            background-color: #e7515a;
            border-color: #e7515a;
        }

        .form-switch.form-switch-secondary .form-check-input:checked {
            background-color: #805dca;
            border-color: #805dca;
        }

        .form-switch.form-switch-warning .form-check-input:checked {
            background-color: #e2a03f;
            border-color: #e2a03f;
        }

        .form-switch.form-switch-info .form-check-input:checked {
            background-color: #2196f3;
            border-color: #2196f3;
        }

        .form-switch.form-switch-dark .form-check-input:checked {
            background-color: #3b3f5c;
            border-color: #3b3f5c;
        }


        /*
    ===========================
        Data Marker ( dot )
    ===========================
  */

        .data-marker {
            padding: 2px;
            border-radius: 50%;
            font-size: 18px;
            display: inline-flex;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
        }

        .data-marker-success {
            background-color: #00ab55;
        }

        .data-marker-warning {
            background-color: #e2a03f;
        }

        .data-marker-danger,
        .data-marker-info,
        .data-marker-dark {
            background-color: #e7515a;
        }

        .badge {
            font-weight: 600;
            line-height: 1.4;
            font-size: 11.9px;
            font-weight: 600;
            transition: all 0.3s ease-out;
            -webkit-transition: all 0.3s ease-out;
            display: inline-block;
            padding: 4.6px 8px;
            color: #FFF;
            border-radius: 6px;
        }

        .badge:hover {
            transition: all 0.3s ease-out;
            -webkit-transition: all 0.3s ease-out;
            -webkit-transform: translateY(-3px);
            transform: translateY(-3px);
        }

        .badge--group {
            display: inline-flex;
        }

        .badge--group .badge {
            border: 2px solid #e0e6ed;
        }

        .badge--group .badge:not(:first-child) {
            margin-left: -6px;
        }

        .badge-dot:empty {
            display: block;
        }

        .badge--group .badge-dot {
            width: 16px;
            height: 16px;
            border-radius: 50%;
            padding: 0;
        }

        .badge svg {
            width: 15px;
            height: 15px;
            vertical-align: top;
            margin-right: 3px;
        }

        .badge.badge-enabled {
            background-color: #00ab55;
            color: #fff;
        }

        .badge.badge-disable {
            background-color: #e7515a;
            color: #fff;
        }

        .badge-collapsed-img img {
            width: 40px;
            height: 40px;
            border-radius: 20px;
            border: 2px solid #515365;
            margin-left: -21px;
        }

        .badge-collapsed-img.badge-tooltip img {
            width: 40px;
            height: 40px;
            border-radius: 20px;
            border: 2px solid #ffffff;
            box-shadow: 0px 0px 15px 1px rgba(113, 106, 202, 0.3);
            margin-left: -21px;
            -webkit-transition: all 0.35s ease;
            transition: all 0.35s ease;
        }

        .badge-collapsed-img.badge-tooltip img:hover {
            -webkit-transform: translateY(-5px) scale(1.02);
            transform: translateY(-5px) scale(1.02);
        }

        .badge-collapsed-img.translateY-axis img {
            -webkit-transition: all 0.35s ease;
            transition: all 0.35s ease;
        }

        .badge-collapsed-img.translateY-axis img:hover {
            -webkit-transform: translateY(-5px) scale(1.02);
            transform: translateY(-5px) scale(1.02);
        }

        .badge-collapsed-img.rectangle-collapsed img {
            width: 45px;
            height: 32px;
        }

        .badge-collapsed-img.translateX-axis img {
            -webkit-transition: all 0.35s ease;
            transition: all 0.35s ease;
        }

        .badge-collapsed-img.translateX-axis img:hover {
            -webkit-transform: translateX(5px) scale(1.02);
            transform: translateX(5px) scale(1.02);
        }

        .badge-primary {
            color: #fff;
            background-color: #4361ee;
        }

        .badge-info {
            color: #fff;
            background-color: #2196f3;
        }

        .badge-success {
            color: #fff;
            background-color: #00ab55;
        }

        .badge-danger {
            color: #fff;
            background-color: #e7515a;
        }

        .badge-warning {
            color: #fff;
            background-color: #e2a03f;
        }

        .badge-dark {
            color: #fff;
            background-color: #3b3f5c;
        }

        .badge-secondary {
            background-color: #805dca;
        }

        .outline-badge-primary {
            color: #4361ee;
            background-color: transparent;
            border: 1px solid #4361ee;
        }

        .outline-badge-info {
            color: #2196f3;
            background-color: transparent;
            border: 1px solid #2196f3;
        }

        .outline-badge-success {
            color: #00ab55;
            background-color: transparent;
            border: 1px solid #00ab55;
        }

        .outline-badge-danger {
            color: #e7515a;
            background-color: transparent;
            border: 1px solid #e7515a;
        }

        .outline-badge-warning {
            color: #e2a03f;
            background-color: transparent;
            border: 1px solid #e2a03f;
        }

        .outline-badge-dark {
            color: #3b3f5c;
            background-color: transparent;
            border: 1px solid #3b3f5c;
        }

        .outline-badge-secondary {
            color: #805dca;
            background-color: transparent;
            border: 1px solid #805dca;
        }

        .outline-badge-primary:focus,
        .outline-badge-primary:hover {
            background-color: #4361ee;
            color: #fff;
        }

        .outline-badge-secondary:focus,
        .outline-badge-secondary:hover {
            color: #fff;
            background-color: #805dca;
        }

        .outline-badge-success:focus,
        .outline-badge-success:hover {
            color: #fff;
            background-color: #00ab55;
        }

        .outline-badge-danger:focus,
        .outline-badge-danger:hover {
            color: #fff;
            background-color: #e7515a;
        }

        .outline-badge-warning:focus,
        .outline-badge-warning:hover {
            color: #fff;
            background-color: #e2a03f;
        }

        .outline-badge-info:focus,
        .outline-badge-info:hover {
            color: #fff;
            background-color: #2196f3;
        }

        .outline-badge-dark:focus,
        .outline-badge-dark:hover {
            color: #fff;
            background-color: #3b3f5c;
        }

        .badge-light-primary {
            color: #4361ee;
            background-color: #eceffe;
            border: 1px solid #eceffe;
        }

        .badge-light-info {
            color: #2196f3;
            background-color: #e6f4ff;
            border: 1px solid #e6f4ff;
        }

        .badge-light-success {
            color: #00ab55;
            background-color: #ddf5f0;
            border: 1px solid #ddf5f0;
        }

        .badge-light-danger {
            color: #e7515a;
            background-color: #fbeced;
            border: 1px solid #fbeced;
        }

        .badge-light-warning {
            color: #e2a03f;
            background-color: #fcf5e9;
            border: 1px solid #fcf5e9;
        }

        .badge-light-dark {
            color: #3b3f5c;
            background-color: #eaeaec;
            border: 1px solid #eaeaec;
        }

        .badge-light-secondary {
            color: #805dca;
            background-color: #f2eafa;
            border: 1px solid #f2eafa;
        }


        /*      Link     */

        .badge[class*=link-badge-] {
            cursor: pointer;
        }

        .link-badge-primary {
            color: #4361ee;
            background-color: transparent;
            border: 1px solid transparent;
        }

        .link-badge-info {
            color: #2196f3;
            background-color: transparent;
            border: 1px solid transparent;
        }

        .link-badge-success {
            color: #00ab55;
            background-color: transparent;
            border: 1px solid transparent;
        }

        .link-badge-danger {
            color: #e7515a;
            background-color: transparent;
            border: 1px solid transparent;
        }

        .link-badge-warning {
            color: #e2a03f;
            background-color: transparent;
            border: 1px solid transparent;
        }

        .link-badge-dark {
            color: #3b3f5c;
            background-color: transparent;
            border: 1px solid transparent;
        }

        .link-badge-secondary {
            color: #805dca;
            background-color: transparent;
            border: 1px solid transparent;
        }

        .link-badge-primary:focus,
        .link-badge-primary:hover {
            color: #4361ee;
            background-color: transparent;
        }

        .link-badge-secondary:focus,
        .link-badge-secondary:hover {
            color: #6f51ea;
            background-color: transparent;
        }

        .link-badge-success:focus,
        .link-badge-success:hover {
            color: #2ea37d;
            background-color: transparent;
        }

        .link-badge-danger:focus,
        .link-badge-danger:hover {
            color: #e7515a;
            background-color: transparent;
        }

        .link-badge-warning:focus,
        .link-badge-warning:hover {
            color: #dea82a;
            background-color: transparent;
        }

        .link-badge-info:focus,
        .link-badge-info:hover {
            color: #009eda;
            background-color: transparent;
        }

        .link-badge-dark:focus,
        .link-badge-dark:hover {
            color: #454656;
            background-color: transparent;
        }

        .avatar {
            position: relative;
            display: inline-block;
            width: 3rem;
            height: 3rem;
            font-size: 1rem;
        }

        .avatar--group {
            display: inline-flex;
            margin-right: 15px;
        }

        .avatar--group.avatar-group-badge {
            position: relative;
        }

        .avatar--group.avatar-group-badge .badge.counter {
            z-index: 2;
            right: 0;
            top: -6px;
            width: 21px;
            height: 21px;
            border-radius: 50%;
            padding: 5px 0px;
            font-size: 9px;
            left: -21px;
            border: none;
        }

        .avatar--group.avatar-group-badge .badge.counter:empty {
            display: block;
            height: 13px;
            width: 13px;
            left: -14px;
            top: 0;
        }

        .avatar img {
            width: 100%;
            height: 100%;
            -o-object-fit: cover;
            object-fit: cover;
        }

        .avatar .avatar-title {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
            background-color: #888ea8;
            color: #fff;
        }

        .avatar .avatar-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
            background-color: #805dca;
            color: #fff;
        }

        .avatar-icon svg {
            width: 24px;
            height: 24px;
            stroke-width: 1.7;
        }

        .avatar--group .avatar-xl {
            margin-left: -1.28125rem;
        }

        .avatar--group .avatar {
            margin-left: -0.75rem;
        }

        .avatar--group img,
        .avatar--group .avatar .avatar-title {
            border: 2px solid #e0e6ed;
        }

        .avatar-xl {
            width: 5.125rem;
            height: 5.125rem;
            font-size: 1.70833rem;
        }

        .avatar-xl svg {
            width: 43px;
            height: 43px;
        }

        .avatar-lg {
            width: 4rem;
            height: 4rem;
            font-size: 1.33333rem;
        }

        .avatar-lg svg {
            width: 32px;
            height: 32px;
        }

        .avatar-sm {
            width: 2.5rem;
            height: 2.5rem;
            font-size: 0.83333rem;
        }

        .avatar-sm svg {
            width: 18px;
            height: 18px;
        }


        /*
  Indicators
  */

        .avatar-indicators:before {
            content: "";
            position: absolute;
            bottom: 1%;
            right: 5%;
            width: 28%;
            height: 28%;
            border-radius: 50%;
            border: 2px solid #fff;
        }

        .avatar-offline:before {
            background-color: #888ea8;
        }

        .avatar-online:before {
            background-color: #009688;
        }

        .avatar.translateY-axis img,
        .avatar.translateY-axis .avatar-title {
            -webkit-transition: all 0.35s ease;
            transition: all 0.35s ease;
        }

        .avatar.translateY-axis img:hover,
        .avatar.translateY-axis .avatar-title:hover {
            -webkit-transform: translateY(-5px) scale(1.02);
            transform: translateY(-5px) scale(1.02);
        }

        .avatar.translateX-axis img,
        .avatar.translateX-axis .avatar-title {
            -webkit-transition: all 0.35s ease;
            transition: all 0.35s ease;
        }

        .avatar.translateX-axis img:hover,
        .avatar.translateX-axis .avatar-title:hover {
            -webkit-transform: translateX(5px) scale(1.02);
            transform: translateX(5px) scale(1.02);
        }


        /*      Avatar      */

        .avatar-chip {
            display: inline-block;
            padding: 0 24px;
            font-size: 16px;
            line-height: 34px;
            border-radius: 25px;
            position: relative;
            box-shadow: 0 10px 20px -10px rgba(0, 0, 0, 0.59);
        }

        .avatar-chip.avatar-dismiss {
            padding: 0 31px 0 25px;
        }

        .avatar-chip img {
            float: left;
            margin: 0px 10px 0px -26px;
            height: 35px;
            width: 35px;
            border-radius: 50%;
        }

        .avatar-chip span.text {
            font-size: 13px;
            font-weight: 600;
        }

        .avatar-chip .closebtn {
            color: #ffffff;
            font-weight: bold;
            /* float: right; */
            font-size: 15px;
            cursor: pointer;
            position: absolute;
            /* left: 0; */
            right: 8px;
        }

        .avatar-chip .closebtn:hover {
            color: #fff;
        }

        .status.rounded-tooltip .tooltip-inner {
            border-radius: 20px;
            padding: 8px 20px;
        }

        .tooltip-inner {
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
        }

        .popover {
            z-index: 999;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
            -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            border-bottom-color: #b3b3b3;
        }

        .help-block,
        .help-inline {
            color: #555555;
        }

        .controls {
            position: relative;
        }


        /* .search-form-control { border-radius: .25rem; } */


        /*
    ====================
        Table
    ====================
  */

        .table {
            color: #515365;
            border-collapse: separate;
            border-spacing: 0;
        }

        .table th .form-check,
        .table td .form-check {
            margin-right: 0;
            display: inline-flex;
            margin-bottom: 0;
        }

        .table .form-check-input {
            background-color: #bfc9d4;
            border-color: #bfc9d4;
        }

        .table thead {
            color: #515365;
            letter-spacing: 1px;
        }

        .table thead tr th {
            border: none;
            background: #ebedf2;
            padding: 10px 21px 10px 21px;
            vertical-align: middle;
            font-weight: 500;
        }

        .table thead tr.table-row-hidden {
            border: none;
        }

        .table:not(.dataTable) thead tr th:first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .table:not(.dataTable) thead tr th:last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .table:not(.dataTable) thead tr th.checkbox-area {
            width: 5%;
        }

        .table tbody {
            border: none;
        }

        .table tbody tr th {
            border: none;
        }

        .table tbody tr td {
            border: none;
            padding: 10px 21px 10px 21px;
            vertical-align: middle;
            letter-spacing: normal;
            white-space: nowrap;
            font-weight: 400;
        }

        .table> :not(:first-child) {
            border: none;
        }

        .table:not(.dataTable) tbody tr td svg {
            width: 17px;
            height: 17px;
            vertical-align: text-top;
            color: #4361ee;
            stroke-width: 1.5;
        }

        .table tbody tr td .table-inner-text {
            margin-left: 5px;
        }

        .table>tbody>tr>td .usr-img-frame {
            background-color: #e0e6ed;
            padding: 2px;
            width: 38px;
            height: 38px;
        }

        .table>tbody>tr>td .usr-img-frame img {
            width: 38px;
            margin: 0;
        }

        .table>tbody>tr>td .progress {
            width: 135px;
            height: 6px;
            margin: auto 0;
        }

        .table>tbody .action-btns .action-btn svg {
            width: 20px;
            height: 20px;
            color: #888ea8;
            stroke-width: 2;
        }

        .table>tbody .action-btns .action-btn:hover svg {
            color: #bfc9d4;
        }

        .table>tbody .action-btns .btn-delete svg {
            color: #f8538d;
        }

        .table>tbody .action-btns .btn-delete:hover svg {
            color: #e7515a;
        }


        /*

    Hover

  */

        .table-hover>tbody>tr:hover td {
            --bs-table-accent-bg: transparent;
            color: #515365;
            background-color: #ebedf2;
            cursor: pointer;
        }

        .table-hover>tbody>tr:hover td:first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .table-hover>tbody>tr:hover td:last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }


        /*
    Hover and Striped
  */

        .table-striped.table-hover>tbody>tr:hover td {
            background-color: #ebedf2;
        }

        .table-striped:not(.dataTable)>tbody>tr:nth-of-type(odd) td {
            --bs-table-accent-bg: transparent;
            color: #3b3f5c;
            background-color: #f1f2f3;
        }

        .table-striped:not(.dataTable)>tbody>tr:nth-of-type(odd) td:first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .table-striped:not(.dataTable)>tbody>tr:nth-of-type(odd) td:last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }


        /*

    Striped

  */


        /*
    Striped and Bordered
  */

        .table:not(.dataTable).table-bordered.table-striped>tbody>tr:nth-of-type(odd) td:first-child {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
        }

        .table:not(.dataTable).table-bordered.table-striped>tbody>tr:nth-of-type(odd) td:last-child {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .table:not(.dataTable).table-bordered.table-striped>tbody>tr:first-child td:first-child {
            border-top-left-radius: 0;
        }

        .table:not(.dataTable).table-bordered.table-striped>tbody>tr:first-child td:last-child {
            border-top-right-radius: 0;
        }

        .table:not(.dataTable).table-bordered.table-striped>tbody>tr:last-child td:first-child {
            border-bottom-left-radius: 10px;
        }

        .table:not(.dataTable).table-bordered.table-striped>tbody>tr:last-child td:last-child {
            border-bottom-right-radius: 10px;
        }

        .table:not(.dataTable).table-bordered thead tr th {
            border: 1px solid #ebedf2;
            background: transparent;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .table:not(.dataTable).table-bordered>tbody>tr td {
            border: 1px solid #ebedf2;
        }

        .table:not(.dataTable).table-bordered>tbody>tr:last-child td:first-child {
            border-bottom-left-radius: 10px;
        }

        .table:not(.dataTable).table-bordered>tbody>tr:last-child td:last-child {
            border-bottom-right-radius: 10px;
        }

        .table:not(.dataTable).table-bordered.table-hover>tbody>tr:hover td:first-child {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
        }

        .table:not(.dataTable).table-bordered.table-hover>tbody>tr:hover td:last-child {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .table:not(.dataTable).table-bordered.table-hover>tbody>tr:hover:first-child td:first-child {
            border-top-left-radius: 0;
        }

        .table:not(.dataTable).table-bordered.table-hover>tbody>tr:hover:first-child td:last-child {
            border-top-right-radius: 0;
        }

        .table:not(.dataTable).table-bordered.table-hover>tbody>tr:hover:last-child td:first-child {
            border-bottom-left-radius: 10px;
        }

        .table:not(.dataTable).table-bordered.table-hover>tbody>tr:hover:last-child td:last-child {
            border-bottom-right-radius: 10px;
        }


        /*

    Bordered

  */


        /*
    Bordered and Hover
  */

        .statbox .widget-content:before,
        .statbox .widget-content:after {
            display: table;
            content: "";
            line-height: 0;
            clear: both;
        }

        .nav-tabs>li>a {
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
        }

        .nav-link {
            color: #3b3f5c;
        }

        .nav-link:hover {
            color: #515365;
        }

        .nav-link:hover svg {
            color: #515365;
        }

        .btn-toolbar {
            margin-left: 0px;
        }

        @media all and (-ms-high-contrast: none),
        (-ms-high-contrast: active) {
            .input-group>.form-control {
                flex: 1 1 auto;
                width: 1%;
            }
        }

        .spin {
            -webkit-animation: spin 2s infinite linear;
            animation: spin 2s infinite linear;
        }

        @keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(359deg);
                transform: rotate(359deg);
            }
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(359deg);
                transform: rotate(359deg);
            }
        }

        .toast-primary {
            background: #4361ee;
        }

        .toast-header {
            background: #4361ee;
            color: #fff;
            border-bottom: 1px solid rgba(33, 150, 243, 0.3411764706);
        }

        .toast-header .meta-time {
            color: #f1f2f3;
        }

        .toast-header .btn-close {
            color: #f1f2f3;
            opacity: 1;
            text-shadow: none;
            background: none;
            padding: 0;
            margin-top: -2px;
        }

        .toast-body {
            padding: 16px 12px;
            color: #fff;
        }


        /*
    ==========================
        Background Colors
    ==========================
  */


        /*
    Default
  */

        .bg-primary {
            background-color: #4361ee !important;
            border-color: #4361ee;
            color: #fff;
        }

        .bg-success {
            background-color: #00ab55 !important;
            border-color: #00ab55;
            color: #fff;
        }

        .bg-info {
            background-color: #2196f3 !important;
            border-color: #2196f3;
            color: #fff;
        }

        .bg-warning {
            background-color: #e2a03f !important;
            border-color: #e2a03f;
            color: #fff;
        }

        .bg-danger {
            background-color: #e7515a !important;
            border-color: #e7515a;
            color: #fff;
        }

        .bg-secondary {
            background-color: #805dca !important;
            border-color: #805dca;
            color: #fff;
        }

        .bg-dark {
            background-color: #3b3f5c !important;
            border-color: #3b3f5c;
            color: #fff;
        }


        /*
    Light Background
  */

        .bg-light-primary {
            background-color: #eceffe !important;
            border-color: #eceffe;
            color: #2196f3;
        }

        .bg-light-success {
            background-color: #ddf5f0 !important;
            border-color: #ddf5f0;
            color: #00ab55;
        }

        .bg-light-info {
            background-color: #e6f4ff !important;
            border-color: #e6f4ff;
            color: #2196f3;
        }

        .bg-light-warning {
            background-color: #fcf5e9 !important;
            border-color: #fcf5e9;
            color: #e2a03f;
        }

        .bg-light-danger {
            background-color: #fbeced !important;
            border-color: #fbeced;
            color: #e7515a;
        }

        .bg-light-secondary {
            background-color: #f2eafa !important;
            border-color: #f2eafa;
            color: #805dca;
        }

        .bg-light-dark {
            background-color: #eaeaec;
            border-color: #eaeaec;
            color: #fff;
        }


        /*
    Progress Bar
  */

        .progress {
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
            background-color: #ebedf2;
            margin-bottom: 1.25rem;
            height: 16px;
            box-shadow: none;
        }

        .progress.progress-bar-stack .progress-bar:last-child {
            border-top-right-radius: 16px;
            border-bottom-right-radius: 16px;
        }

        .progress .progress-bar {
            font-size: 10px;
            font-weight: 700;
            box-shadow: 0 2px 4px rgba(0, 69, 255, 0.15), 0 8px 16px rgba(0, 69, 255, 0.2);
            font-size: 12px;
            letter-spacing: 1px;
            font-weight: 100;
        }

        .progress:not(.progress-bar-stack) .progress-bar {
            border-radius: 16px;
        }

        .progress-sm {
            height: 4px;
        }

        .progress-md {
            height: 10px;
        }

        .progress-lg {
            height: 20px;
        }

        .progress-xl {
            height: 25px;
        }

        .progress-striped .progress-bar {
            background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
            background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
            background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
            background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
            background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
        }

        .progress .progress-title {
            display: flex;
            justify-content: space-between;
            padding: 15px;
        }

        .progress .progress-title span {
            align-self: center;
        }

        .progress .progress-bar.bg-gradient-primary {
            background-color: #4361ee;
            background: linear-gradient(to right, #0081ff 0%, #0045ff 100%);
        }

        .progress .progress-bar.bg-gradient-info {
            background-color: #4361ee;
            background-image: linear-gradient(to right, #04befe 0%, #4481eb 100%);
        }

        .progress .progress-bar.bg-gradient-success {
            background-color: #4361ee;
            background-image: linear-gradient(to right, #3cba92 0%, #0ba360 100%);
        }

        .progress .progress-bar.bg-gradient-warning {
            background-color: #4361ee;
            background-image: linear-gradient(to right, #f09819 0%, #ff5858 100%);
        }

        .progress .progress-bar.bg-gradient-secondary {
            background-color: #4361ee;
            background-image: linear-gradient(to right, #7579ff 0%, #b224ef 100%);
        }

        .progress .progress-bar.bg-gradient-danger {
            background-color: #4361ee;
            background-image: linear-gradient(to right, #d09693 0%, #c71d6f 100%);
        }

        .progress .progress-bar.bg-gradient-dark {
            background-color: #4361ee;
            background-image: linear-gradient(to right, #2b5876 0%, #4e4376 100%);
        }


        /*
    =====================
        BreadCrumbs
    =====================
  */

        .page-meta {
            margin-top: 25px;
        }

        .page-meta .breadcrumb .breadcrumb-item {
            font-size: 17px;
            font-weight: 500;
            letter-spacing: 1px;
        }

        .page-meta .breadcrumb .breadcrumb-item a {
            vertical-align: inherit;
        }

        .page-meta .breadcrumb .breadcrumb-item.active {
            font-weight: 500;
        }

        .breadcrumb {
            background-color: transparent;
            margin-bottom: 0;
        }

        .breadcrumb-wrapper-content {
            background-color: #f1f2f3;
            padding: 13px 23px;
            border-radius: 8px;
            box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
        }

        .breadcrumb .breadcrumb-item a {
            color: #888ea8;
            vertical-align: text-bottom;
            vertical-align: text-top;
        }

        .breadcrumb .breadcrumb-item.active a {
            color: #515365;
        }

        .breadcrumb .breadcrumb-item a svg {
            width: 19px;
            height: 19px;
            vertical-align: sub;
            stroke-width: 1.4px;
        }

        .breadcrumb .breadcrumb-item a .inner-text {
            margin-left: 10px;
        }

        .breadcrumb .breadcrumb-item span {
            vertical-align: text-bottom;
        }

        .breadcrumb .breadcrumb-item.active {
            color: #3b3f5c;
            font-weight: 600;
        }


        /*
    Style Two
  */

        .breadcrumb-style-two .breadcrumb-item+.breadcrumb-item::before {
            content: ".";
            position: relative;
            top: -9px;
            font-size: 21px;
            height: 7px;
        }


        /*
    Style Three
  */

        .breadcrumb-style-three .breadcrumb-item+.breadcrumb-item::before {
            content: "-";
        }


        /*
    Style Four
  */

        .breadcrumb-style-four .breadcrumb-item+.breadcrumb-item::before {
            content: "|";
        }


        /*
    Style Five
  */

        .breadcrumb-style-five .breadcrumb-item+.breadcrumb-item::before {
            content: "";
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-chevron-right' style='color: %23888ea8;'%3E%3Cpolyline points='9 18 15 12 9 6'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: center;
            color: #6E6B7B;
            margin-right: 0.6rem;
            background-size: 12px;
            height: 20px;
        }

        .br-0 {
            border-radius: 0 !important;
        }

        .br-4 {
            border-radius: 4px !important;
        }

        .br-6 {
            border-radius: 6px !important;
        }

        .br-8 {
            border-radius: 8px !important;
        }

        .br-30 {
            border-radius: 30px !important;
        }

        .br-50 {
            border-radius: 50px !important;
        }

        .br-left-30 {
            border-top-left-radius: 30px !important;
            border-bottom-left-radius: 30px !important;
        }

        .br-right-30 {
            border-top-right-radius: 30px !important;
            border-bottom-right-radius: 30px !important;
        }

        .bx-top-6 {
            border-top-right-radius: 6px !important;
            border-top-left-radius: 6px !important;
        }

        .bx-bottom-6 {
            border-bottom-right-radius: 6px !important;
            border-bottom-left-radius: 6px !important;
        }


        /*      Badge Custom      */

        .badge.counter {
            position: absolute;
            z-index: 2;
            right: 0;
            top: -10px;
            font-weight: 600;
            width: 19px;
            height: 19px;
            border-radius: 50%;
            padding: 2px 0px;
            font-size: 12px;
        }


        /*-------text-colors------*/

        .text-primary {
            color: #4361ee !important;
        }

        .text-success {
            color: #00ab55 !important;
        }

        .text-info {
            color: #2196f3 !important;
        }

        .text-danger {
            color: #e7515a !important;
        }

        .text-warning {
            color: #e2a03f !important;
        }

        .text-secondary {
            color: #805dca !important;
        }

        .text-dark {
            color: #3b3f5c !important;
        }

        .text-muted {
            color: #888ea8 !important;
        }

        .text-white {
            color: #fff !important;
        }

        .text-black {
            color: #000 !important;
        }


        /*-----border main------*/

        .border {
            border: 1px solid !important;
        }

        .border-bottom {
            border-bottom: 1px solid !important;
        }

        .border-top {
            border-top: 1px solid !important;
        }

        .border-right {
            border-right: 1px solid !important;
        }

        .border-left {
            border-left: 1px solid !important;
        }

        .border-primary {
            border-color: #4361ee !important;
        }

        .border-info {
            border-color: #2196f3 !important;
        }

        .border-warning {
            border-color: #e2a03f !important;
        }

        .border-success {
            border-color: #00ab55 !important;
        }

        .border-danger {
            border-color: #e7515a !important;
        }

        .border-secondary {
            border-color: #805dca !important;
        }

        .border-dark {
            border-color: #3b3f5c !important;
        }


        /*-----border style------*/

        .border-dotted {
            border-style: dotted !important;
        }

        .border-dashed {
            border-style: dashed !important;
        }

        .border-solid {
            border-style: solid !important;
        }

        .border-double {
            border-style: double !important;
        }


        /*-----border width------*/

        .border-width-1px {
            border-width: 1px !important;
        }

        .border-width-2px {
            border-width: 2px !important;
        }

        .border-width-3px {
            border-width: 3px !important;
        }

        .border-width-4px {
            border-width: 4px !important;
        }

        .border-width-5px {
            border-width: 5px !important;
        }

        .border-width-6px {
            border-width: 6px !important;
        }


        /*-----transform-position------*/

        .position-absolute {
            position: absolute;
        }

        .position-static {
            position: static;
        }

        .position-fixed {
            position: fixed;
        }

        .position-inherit {
            position: inherit;
        }

        .position-initial {
            position: initial;
        }

        .position-relative {
            position: relative;
        }

    </style>

</head>

<body class="layout-boxed">
<!-- BEGIN LOADER -->
<div id="load_screen">
    <div class="loader">
        <div class="loader-content">
            <div class="spinner-grow align-self-center"></div>
        </div>
    </div>
</div>
<!--  END LOADER -->

<!--  BEGIN NAVBAR  -->
<div class="header-container container-xxl">
    <header class="header navbar navbar-expand-sm">
        <ul class="navbar-item theme-brand flex-row text-center">
            <li class="nav-item theme-text">
                <a href="" class="nav-link">YPMS </a>
            </li>
        </ul>

        <ul
                class="navbar-item theme-brand flex-row text-center"
                style="display: flex; justify-content: space-between;"
        >

            <li class="nav-item theme-text">
            <span style="font-size: 20px; font-weight: 100; "
            >User: manager saleh</span
            >
            </li>
            <span style="font-size: 20px; font-weight: 100;" ;
            >Rank: 1</span
            >
            </li>
        </ul>
    </header>
</div>
<!--  END NAVBAR  -->

<!--  BEGIN MAIN CONTAINER  -->
<div class="main-container" id="container">
    <div class="overlay"></div>
    <div class="search-overlay"></div>

    <!--  BEGIN SIDEBAR  -->
    <div class="sidebar-wrapper sidebar-theme">
        <nav id="sidebar">
            <div class="navbar-nav theme-brand flex-row text-center">
                <div class="nav-logo"></div>
                <div class="nav-item sidebar-toggle">
                    <div class="btn-toggle sidebarCollapse">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-left">
                            <polyline points="11 17 6 12 11 7"></polyline>
                            <polyline points="18 17 13 12 18 7"></polyline>
                        </svg>
                    </div>
                </div>
            </div>
            <div class="shadow-bottom"></div>

            <ul class="list-unstyled menu-categories" id="accordionExample">
                <li href="ViewEmp" class="menu">
                    <a href="ViewEmp" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart">
                                <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
                                <path d="M22 12A10 10 0 0 0 12 2v10z"></path>
                            </svg>
                            <span href="ViewEmp">View Employees</span>
                        </div>
                    </a>
                </li>

                <li class="menu">
                    <a href="reqPromo" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart">
                                <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
                                <path d="M22 12A10 10 0 0 0 12 2v10z"></path>
                            </svg>
                            <span href="reqPromo">Promo Request</span>
                        </div>
                    </a>
                </li>

                <li href="applyPromo" class="menu">
                    <a href="applyPromo" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart">
                                <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
                                <path d="M22 12A10 10 0 0 0 12 2v10z"></path>
                            </svg>
                            <span href="applyPromo">Apply-Promotion</span>
                        </div>
                    </a>
                </li>

                <li href="reqTransfer" class="menu">
                    <a href="reqTransfer" aria-expanded="false" class="dropdown-toggle">
                        <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart">
                                <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
                                <path d="M22 12A10 10 0 0 0 12 2v10z"></path>
                            </svg>
                            <span href="reqTransfer">Transfer Request</span>
                        </div>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

</body>

</html>
