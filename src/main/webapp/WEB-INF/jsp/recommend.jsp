<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en"> <!--<![endif]-->

<%
    String select_sector = request.getParameter("serchsector");

%>

<% //mariaDB 준비
    Class.forName("org.mariadb.jdbc.Driver");
    System.out.println("mariadb 사용가능");

    // mariaDB 연결
    Connection conn = DriverManager.getConnection("jdbc:mariadb://capstonedb.cqecmwhyjxfy.ap-northeast-2.rds.amazonaws.com:3306/capstoneDB", "capstone4", "capstone4");
    System.out.println(conn + "<-- conn");
%>

<head>
    <meta charset="utf-8">
    <title>KSS 주가 예측</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">

    <!--Google Font link-->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">


    <link rel="stylesheet" href="/css/slick/slick.css">
    <link rel="stylesheet" href="/css/slick/slick-theme.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/iconfont.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/bootsnav.css">

    <!-- xsslider slider css -->


    <!--<link rel="stylesheet" href="/css/xsslider.css">-->


    <!--For Plugins external css-->
    <!--<link rel="stylesheet" href="/css/plugins.css" />-->

    <!--Theme custom css -->
    <link rel="stylesheet" href="/css/style.css">
    <!--<link rel="stylesheet" href="/css/colors/maron.css">-->

    <!--Theme Responsive css-->
    <link rel="stylesheet" href="/css/responsive.css"/>

    <script src="/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

</head>

<body data-spy="scroll" data-target=".navbar-collapse">


<!-- Preloader -->
<div id="loading">
    <div id="loading-center">
        <div id="loading-center-absolute">
            <div class="object" id="object_one"></div>
            <div class="object" id="object_two"></div>
            <div class="object" id="object_three"></div>
            <div class="object" id="object_four"></div>
        </div>
    </div>
</div><!--End off Preloader -->


<div class="culmn">
    <!--Home page style-->

    <nav class="navbar navbar-default bootsnav navbar-fixed">
        <div class="navbar-top bg-grey fix">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="navbar-callus text-left sm-text-center">
                            <ul class="list-inline">

                                <li><a href=""><i class="fa fa-envelope-o"></i> Contact us: mju_kss@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->


        <div class="container">
            <div class="attr-nav">
                <ul>
                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                </ul>
            </div>

            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#brand">
                    <img src="/images/logo.png" class="logo" alt="">
                    <!--<img src="/images/footer-logo.png" class="logo logo-scrolled" alt="">-->
                </a>

            </div>
            <!-- End Header Navigation -->

            <!-- navbar menu -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index#home">Home</a></li>
                    <li><a href="index#features">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#business" id="navbarScrollingDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Service
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                            <li><a class="dropdown-item" href="recommend">recommend</a></li>
                            <li><a class="dropdown-item" href="prediction">prediction</a></li>
                        </ul>
                    </li>
                    <li><a href="index#contact">Contact</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>

    </nav>

    <!--네비바 가려짐 방지-->
    <section id="ppadding">
        <div class="container">
            <h1 style="color: white">. </h1>
            <h1 style="color: white">. </h1>
        </div>
    </section>
    <!--Featured Section-->


    <!--Business Section-->
    <section id="content" class="content bg-grey roomy-70">
        <div class="container ">


            <h3 class="sub-title text-center">
                <strong>주식 추천 서비스</strong>
            </h3>
            <h6 class=text-center> 업종별 등락률 기준 Top5와 자신이 원하는 1주당 금액을 가진 주식을 추천해 주는 서비스입니다.</h6>


            <div class="sub-content bg-white">
                <h3>업종별 Top5</h3>
                <hr>
                <div class="sub-section">
                    <div class="select_st">
                        업종 선택
                        <form method="post" name="frm">
                        <select class="selectpicker" name="serchsector" id="serchsector" onchange="handleOnChange(this)">
                            <option value="">선택</option>
                            <option value="1">금융</option>
                            <option value="2">반도체</option>
                            <option value="3">오락/문화</option>
                            <option value="4">의약품</option>
                            <option value="5">자동차</option>

                        </select>
                        </form>
                    </div>


                    <div class="setcenter">
                        <div class="top5box" style="margin-top:10px; ">

                            <table class="type09">

                                <%

                                    // 쿼리
                                    PreparedStatement stmttop = conn.prepareStatement("select Company_name from top5 where Sectors_code=1");
                                    System.out.println(stmttop + "<-- topstmt");

                                    // 쿼리 실행
                                    ResultSet rstop = stmttop.executeQuery();


                                %>

                                <thead>
                                <tr>
                                    <th scope="cols">순위</th>
                                    <th scope="cols">종목</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%
                                    int rank=1;
                                    while (rstop.next()) {


                                %>

                                <tr>
                                    <th scope="row">Top <%=rank%>
                                    </th>
                                    <td><%=rstop.getString("company_name") %>
                                    </td>
                                </tr>

                                </tbody>
                                <%
                                   rank+=1; }
                                %>


                            </table>

                        </div>
                    </div>
                </div>



            </div>

            <div class="sub-content bg-white">
                <h3>금액별 주식 추천</h3>
                <hr>
                <div class="sub-section">
                    <div class="setcost">
                        1주당 희망 금액(₩) :
                        <input type="text">
                        ~
                        <input type="text">

                    </div>


                    <div class="setcenter">

                        <table class="type09">
                            <thead>
                            <tr>
                                <th scope="cols">추천 종목</th>
                                <th scope="cols"></th>

                            </tr>
                            </thead>

                            <tbody>
                            <tr>
                                <th scope="row">종목명</th>
                                <td>주식명</td>
                            </tr>
                            <tr>
                                <th scope="row">종목코드</th>
                                <td>코드</td>
                            </tr>
                            <tr>
                                <th scope="row">업종</th>
                                <td>업종</td>
                            </tr>
                            <tr>
                                <th scope="row">등락률</th>
                                <td>등락률</td>
                            </tr>
                            <tr>
                                <th scope="row">현재가</th>
                                <td>1주 가격</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="setcenter" style="margin-top: 20px">
                        <h3 class="txtcenter">주가 변화 양상</h3>
                        <img src="/images/graph.png" class="graph" alt="" width="480px" height="480px">
                    </div>

                    <div style="text-align: center; margin-top: 20px">
                        <a onclick="location='prediction'" class="btn btn-primary m-top-20">➔ 주가 예측 서비스 바로가기</a>
                    </div>


                </div>


            </div>
        </div>


    </section>
    <!-- End off Business section -->


    <footer>
        <div class="main_footer fix bg-mega text-center p-top-40 p-bottom-30 m-top-50">
            <p>KSS가 제공하는 정보는투자 참고 사항이며, 불가피한 오류 또는 누락이 발생하거나 지연 제공될 수 있습니다. </p>
            <img src="/images/logo.png" class="logo" alt="">
        </div>
    </footer>


</div>

<!-- JS includes -->

<script src="/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/js/vendor/bootstrap.min.js"></script>

<script src="/js/owl.carousel.min.js"></script>
<script src="/js/jquery.magnific-popup.js"></script>
<script src="/js/jquery.easing.1.3.js"></script>
<script src="/css/slick/slick.js"></script>
<script src="/css/slick/slick.min.js"></script>
<script src="/js/jquery.collapse.js"></script>
<script src="/js/bootsnav.js"></script>


<script src="/js/plugins.js"></script>
<script src="/js/main.js"></script>
<script src="/js/recommend.js"></script>

</body>
</html>