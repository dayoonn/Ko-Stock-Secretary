<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>


<%
    String Date = new java.text.SimpleDateFormat("yyyy. MM. dd").format(new java.util.Date());
    String Today = new java.text.SimpleDateFormat("yy/MM/dd").format(new java.util.Date());

    Calendar day = Calendar.getInstance();
    day.add(Calendar.DATE, +1);
    String Nextday = new java.text.SimpleDateFormat("yy/MM/dd").format(day.getTime());
%>

<%
    String select_stock = 's'+request.getParameter("searchstock");
    String company_code = request.getParameter("searchstock");
    String graph="/images/"+company_code+".png";

%>


<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en"> <!--<![endif]-->
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

    <% //mariaDB 준비
        Class.forName("org.mariadb.jdbc.Driver");
        System.out.println("mariadb 사용가능");

        // mariaDB 연결
        Connection conn = DriverManager.getConnection("jdbc:mariadb://capstonedb.cqecmwhyjxfy.ap-northeast-2.rds.amazonaws.com:3306/capstoneDB", "capstone4", "capstone4");
        System.out.println(conn + "<-- conn");
    %>
    <section id="content" class="content bg-grey roomy-70">
        <div class="container ">


            <h3 class="sub-title text-center">
                <strong>주가 예측 서비스</strong>
            </h3>
            <h6 class=text-center> 종가 기준 과거의 수치 데이터와 뉴스 기사에 따른 긍/부정 판단을 통한 주가 예측 서비스 입니다.</h6>


            <div style="padding: 30px;" class="sub-content bg-white">
                <div class="select_st">
                    종목 선택
                    <form method="post" name="frm" action="prediction_result">
                        <select name="searchstock" id="searchstock" class="selectpicker" >
                            <option value="">선택</option>
                            <optgroup label="반도체">
                                <option value="033160">엠케이전자</option>
                                <option value="046890">서울반도체</option>
                                <option value="108320">LX세미콘</option>
                                <option value="240810">원익IPS</option>
                                <option value="005290">동진세미켐</option>
                                <option value="033640">네패스</option>
                                <option value="222800">심텍</option>
                                <option value="067310">하나마이크론</option>
                                <option value="036540">SFA반도체</option>
                                <option value="084850">아이티엠반도체</option>
                            </optgroup>
                            <optgroup label="금융">
                                <option value="105560">KB금융</option>
                                <option value="055550">시난지주</option>
                                <option value="086790">하나금융지주</option>
                                <option value="316140">우리금융지주</option>
                                <option value="024110">기업은행</option>
                                <option value="032830">삼성생명</option>
                                <option value="001510">SK</option>
                                <option value="088350">한화생명</option>
                                <option value="006800">미래에셋증권</option>
                                <option value="138930">BNK금융지주</option>
                            </optgroup>
                            <optgroup label="의약품">

                                <option value="207940">삼성바이오로직스</option>
                                <option value="068270">셀트리온</option>
                                <option value="000100">유한양행</option>
                                <option value="006280">녹십자</option>
                                <option value="128940">한미약품</option>
                                <option value="069620">대웅제약</option>
                                <option value="001630">종근당홀딩스</option>
                                <option value="170900">동아에스티</option>
                                <option value="185750">종근당</option>
                                <option value="009290">광동제약</option>
                            </optgroup>

                            <optgroup label="오락/문화">

                                <option value="034230">파라다이스</option>
                                <option value="041510">에스엠</option>
                                <option value="253450">스튜디오드래곤</option>
                                <option value="122870">와이지엔터테인먼트</option>
                                <option value="047820">초록뱀미디어</option>
                                <option value="160550">NEW</option>
                                <option value="035900">JYP Ent.</option>
                                <option value="046140">SBS콘텐츠허브</option>
                                <option value="299900">위지윅스튜디오</option>
                                <option value="111710">남화산업</option>
                            </optgroup>
                            <optgroup label="자동차">

                                <option value="000270">기아</option>
                                <option value="012330">현대모비스</option>
                                <option value="005380">현대차</option>
                                <option value="005850">에스엘</option>
                                <option value="161390">한국타이어엔테크놀로지</option>
                                <option value="060980">한라홀딩스</option>
                                <option value="002350">넥센타이어</option>
                                <option value="011210">현대위아</option>
                                <option value="043370">피에이치에이</option>
                                <option value="015750">성우하이텍</option>
                            </optgroup>
                        </select>
                        <input type="submit" value="🔍" style="font-size:x-small">
                    </form>
                </div>

                <hr>
                <%

                    // 쿼리
                    PreparedStatement stmtres = conn.prepareStatement("select date,Company_name,round(seven_days_ago_middle_ratio,4)*100 as mid_ratio,round(seven_days_ago_negative_ratio,4)*100 as nega_ratio,round(seven_days_ago_positive_ratio,4)*100 as posi_ratio from crawling_ratio where Company_code="+company_code+"");
                    System.out.println(stmtres + "<-- posistmt");

                    // 쿼리 실행
                    ResultSet rsres = stmtres.executeQuery();

                    //chart js


                    while (rsres.next()) {

                        String js_posi = rsres.getString("posi_ratio");
                        String js_midd = rsres.getString("mid_ratio");
                        String js_nega = rsres.getString("nega_ratio");

                        request.setAttribute("js_posi", js_posi);
                        request.setAttribute("js_nega", js_nega);
                        request.setAttribute("js_midd", js_midd);


                %>

                <script>
                    var js_posi = "${js_posi}";
                    var js_nega = "${js_nega}";
                    var js_midd = "${js_midd}";

                </script>


                <div style="padding: 10px; text-align: center" class="result center">
                    <div style="text-align:center" ;>
                        <img src=<%=graph%> class="graph" alt="" width="480px" height="480px">
                    </div>

                    <div style="text-align: center;" class="preBox-top">
                        <div style="font-size:x-large;">

                            <span style="color: #0b0b0b"><%=Nextday%>
                           <em class="up"> <%=rsres.getString("Company_name")%></em>
                           예측 결과
                            </span>
                        </div>

                        <div class="date"><em><%=(Today)%> 장마감 기준 </em>
                            <hr>
                        </div>


                        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
                        <div style="display: flex;justify-content: center">

                            <canvas id="doughnut-chart" width="380px" height="380px"
                                    style="text-align: center"></canvas>

                        </div>


                        <div class="mainitem">
                            <div style="margin-top:10px" class="news">
                                <h3>
                                    <span class="">기사 분석 결과 :</span>
                                    <span class="up"> 긍정 <%=rsres.getString("posi_ratio")%>%</span>
                                    <span class="down"> 부정 <%=rsres.getString("nega_ratio")%> % </span>
                                    <span class="middle"> 중립 <%=rsres.getString("mid_ratio")%> % </span>
                                </h3>
                                <!--h6 class="middle">기준일로부터 7일간 수집된 기사를 반영한 결과입니다.</h6-->
                            </div>
                        </div>

                        <%}%>


                        <%

                            // 쿼리
                            PreparedStatement stmtacc = conn.prepareStatement("select Company_name,round(accurary,2) as acc,round(decline,2) as decline,round(rise,2) as rise from accuracy where Company_code="+company_code+"");
                            System.out.println(stmtacc + "<-- accstmt");

                            // 쿼리 실행
                            ResultSet rsacc = stmtacc.executeQuery();

                            //chart js


                            while (rsacc.next()) {

                                String js_acc = rsacc.getString("acc");
                                String js_decline = rsacc.getString("decline");
                                String js_rise = rsacc.getString("rise");

                                request.setAttribute("js_acc", js_acc);
                                request.setAttribute("js_decline", js_decline);
                                request.setAttribute("js_rise", js_rise);


                        %>

                        <script>
                            var js_acc = "${js_acc}";
                            var js_decline = "${js_decline}";
                            var js_rise = "${js_rise}";

                        </script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

                        <div style="display: flex;justify-content: center">
                            <canvas id="bar-chart" width="380px" height="380px" style="text-align: center"></canvas>
                        </div>

                        <div class="preresult">
                            <div style="margin-top:10px" class="">
                                <h3>
                                    <span class=""> 수치+NLP 분석 결과 </span>
                                    <span class="up"> 상승률 <%=rsacc.getString("rise")%>%, </span>
                                    <span class="down"> 하락률 <%=rsacc.getString("decline")%>% </span>
                                    <span class="">로 예상됩니다.</span>
                                </h3>
                            </div>
                        </div>
                        <%}%>
                        <hr>


                        <div class="setcenter">
                            <h3>
                                기업뉴스</h3>
                            <div class="newsbox" style="margin-top:10px; ">

                                <table class="type09red">


                                    <%

                                        String news=select_stock+"crawling";

                                        // 쿼리
                                        PreparedStatement stmtposi = conn.prepareStatement("select date,title,label from crawling where label='2' and Company_code="+company_code+" order by date desc");
                                        System.out.println(stmtposi + "<-- posistmt");

                                        // 쿼리 실행
                                        ResultSet rsposi = stmtposi.executeQuery();

                                    %>
                                    <thead>
                                    <tr>
                                        <th scope="cols">날짜</th>
                                        <th scope="cols">긍정 뉴스 타이틀</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%
                                        while (rsposi.next()) {

                                    %>

                                    <tr>
                                        <th scope="row"><%=rsposi.getString("Date") %>
                                        </th>
                                        <td><%=rsposi.getString("Title") %>
                                        </td>
                                    </tr>

                                    </tbody>
                                    <%
                                        }
                                    %>


                                </table>
                                <% // 쿼리
                                    PreparedStatement stmtnega = conn.prepareStatement("select date,title,label from crawling where label='1' and Company_code="+company_code+" order by date desc");
                                    System.out.println(stmtnega + "<-- negastmt");

                                    // 쿼리 실행
                                    ResultSet rsnega = stmtnega.executeQuery();

                                %>
                            </div>

                            <div class="newsbox" style="margin-top:10px; ">

                                <table class="type09blue">
                                    <thead>
                                    <tr>
                                        <th scope="cols">날짜</th>
                                        <th scope="cols">부정 뉴스 타이틀</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        while (rsnega.next()) {

                                    %>

                                    <tr>
                                        <th scope="row"><%=rsnega.getString("Date") %>
                                        </th>
                                        <td><%=rsnega.getString("Title") %>
                                        </td>
                                    </tr>

                                    <%
                                        }
                                    %>


                                    </tbody>


                                </table>

                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </div>

    </section><!-- End off Business section -->


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
<script src="/js/prediction.js"></script>
<script src="/js/chart.js"></script>

</body>
</html>