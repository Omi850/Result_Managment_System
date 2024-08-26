<%@page import="java.io.PrintWriter"%>
<%@page import="com.bean.student"%>
<%@page import="com.bean.result"%>
<%@page import="com.dau.Query"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
*,
*::after,
*::before{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

:root{
    --blue-color: #0c2f54;
    --dark-color: #535b61;
    --white-color: #fff;
}

ul{
    list-style-type: none;
}
ul li{
    margin: 2px 0;
}

/* text colors */
.text-dark{
    color: var(--dark-color);
}
.text-blue{
    color: var(--blue-color);
}
.text-end{
    text-align: right;
}
.text-center{
    text-align: center;
}
.text-start{
    text-align: left;
}
.text-bold{
    font-weight: 700;
}
/* hr line */
.hr{
    height: 1px;
    background-color: rgba(0, 0, 0, 0.1);
}
/* border-bottom */
.border-bottom{
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

body{
    font-family: 'Poppins', sans-serif;
    color: var(--dark-color);
    font-size: 14px;
}
.invoice-wrapper{
    min-height: 100vh;
    background-color: rgba(0, 0, 0, 0.1);
    padding-top: 20px;
    padding-bottom: 20px;
}
.invoice{
    max-width: 850px;
    margin-right: auto;
    margin-left: auto;
    background-color: var(--white-color);
    padding: 70px;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    min-height: 920px;
}
.invoice-head-top-left img{
    width: 130px;
}
.invoice-head-top-right h3{
    font-weight: 500;
    font-size: 27px;
    color: var(--blue-color);
}
.invoice-head-middle, .invoice-head-bottom{
    padding: 16px 0;
}
.invoice-body{
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 4px;
    overflow: hidden;
}
.invoice-body table{
    border-collapse: collapse;
    border-radius: 4px;
    width: 100%;
}
.invoice-body table td, .invoice-body table th{
    padding: 12px;
}
.invoice-body table tr{
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}
.invoice-body table thead{
    background-color: rgba(0, 0, 0, 0.02);
}
.invoice-body-info-item{
    display: grid;
    grid-template-columns: 80% 20%;
}
.invoice-body-info-item .info-item-td{
    padding: 12px;
    background-color: rgba(0, 0, 0, 0.02);
}
.invoice-foot{
    padding: 30px 0;
}
.invoice-foot p{
    font-size: 12px;
}
.invoice-btns{
    margin-top: 20px;
    display: flex;
    justify-content: center;
}
.invoice-btn{
    padding: 3px 9px;
    color: var(--dark-color);
    font-family: inherit;
    border: 1px solid rgba(0, 0, 0, 0.1);
    cursor: pointer;
}

.invoice-head-top, .invoice-head-middle, .invoice-head-bottom{
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    padding-bottom: 10px;
}

@media screen and (max-width: 992px){
    .invoice{
        padding: 40px;
    }
}

@media screen and (max-width: 576px){
    .invoice-head-top, .invoice-head-middle, .invoice-head-bottom{
        grid-template-columns: repeat(1, 1fr);
    }
    .invoice-head-bottom-right{
        margin-top: 12px;
        margin-bottom: 12px;
    }
    .invoice *{
        text-align: left;
    }
    .invoice{
        padding: 28px;
    }
}

.overflow-view{
    overflow-x: scroll;
}
.invoice-body{
    min-width: 600px;
}

@media print{
    .print-area{
        visibility: visible;
        width: 100%;
        position: absolute;
        left: 0;
        top: 0;
        overflow: hidden;
    }

    .overflow-view{
        overflow-x: hidden;
    }

    .invoice-btns{
        display: none;
    }
}
        </style>
       <script>
        function printInvoice(){
            window.print();
        }</script>
    </head>
    <body>
  <%
   int id=Integer.parseInt(request.getParameter("id"));
   if(Query.resultrun(id)==false){
	      PrintWriter pw=response.getWriter();
		  pw.print("<html><script>alert('Result Not Uploaded!!');window.location.replace('fetch.jsp');</script></html>");
   }
   result rs=Query.resultdata(id);
   student data=Query.fetchdata(id);
  %>
        <div class = "invoice-wrapper" id = "print-area">
            <div class = "invoice">
                <div class = "invoice-container">
                    <div class = "invoice-head">
                        <div class = "invoice-head-top">
                            <div class = "invoice-head-top-left text-start">
                                <img style="width: 100px" src = "https://previews.123rf.com/images/valentint/valentint1612/valentint161203140/67360197-results-icon-green-website-button-on-white-background.jpg">
                            </div>
                            <div class = "invoice-head-top-right text-end">
                                <h3>Student Result</h3>
                            </div>
                        </div>
                        <div class = "hr"></div>
                        <div class = "invoice-head-middle">
                            
                        </div>
                        <div class = "hr"></div>
                        <div class = "invoice-head-bottom">
                            <div class = "invoice-head-bottom-left">
                                <ul>
                                    <li class = 'text-bold'>Student Information:</li>
                                    <li>Id-<%=data.getId()%></li>
                                    <li><%=data.getName()%></li>
                                    <li><%=data.getGender()%></li>
                                    <li><%=data.getMobile()%></li>
                                </ul>
                            </div>
                            <div class = "invoice-head-bottom-right">
                                <ul class = "text-end">
                                    <li class = 'text-bold'>Address</li>
                                    <li><%=data.getCity()%></li>
                                    <li>Maharashtra 411053</li>
                                    <li>Indian</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class = "overflow-view">
                        <div class = "invoice-body">
                            <table border="1px">
                                <thead>
                                    <tr>
                                        <td class = "text-bold">Subject Name</td>
                                        <td class = "text-bold">Obtained</td>
                                        <td class = "text-bold">Marks</td>
                                        <td class = "text-bold">Result</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Java</td>
                                        <td><%=rs.getJava()%></td>
                                        <td>100</td>
                                        <td><%if(rs.getJava()>=35)
                                        {out.print("pass");}else{
                                         out.print("Fail");
                                        }
                                        %></td>
                                    </tr>
                                    <tr>
                                        <td>Core Java</td>
                                        <td><%=rs.getAjava()%></td>
                                        <td>100</td>
                                        <td><%if(rs.getAjava()>=35)
                                        {out.print("pass");}else{
                                         out.print("Fail");
                                        }
                                        %></td>                                    </tr>
                                    <tr>
                                        <td>Html</td>
                                        <td><%=rs.getHtml()%></td>
                                        <td>100</td>
                                        <td><%if(rs.getHtml()>=35)
                                        {out.print("pass");}else{
                                         out.print("Fail");
                                        }
                                        %></td>                                    </tr>
                                    <tr>
                                        <td>Css</td>
                                        <td><%=rs.getCss()%></td>
                                        <td>100</td>
                                        <td><%if(rs.getCss()>=35)
                                        {out.print("pass");}else{
                                         out.print("Fail");
                                        }
                                        %></td>                                    </tr>
                                    <tr>
                                        <td>JavaCript</td>
                                        <td><%=rs.getScript()%></td>
                                        <td>100</td>
                                        <td><%if(rs.getScript()>=35)
                                        {out.print("pass");}else{
                                         out.print("Fail");
                                        }
                                        %></td>                                    </tr>
                                </tbody>
                            </table>
                            <div class="invoice-body-bottom">
                                <div class="invoice-body-info-item border-bottom">
                                    <div class="info-item-td text-end text-bold">Total Marks:</div>
                                    <div class="info-item-td text-start"><%=rs.getTotal_mark()%></div>
                                </div>
                                <div class="invoice-body-info-item border-bottom">
                                    <div class="info-item-td text-end text-bold">Result:</div>
                                    <div class="info-item-td text-start">
                                    
                                        <%if(rs.getJava()>=35 && rs.getAjava()>=35 && rs.getHtml()>=35
                                        		&& rs.getCss()>=35 && rs.getScript()>=35
                                        		)
                                        {out.print("pass");}else{
                                         out.print("Fail");
                                        }
                                        %></td></div>
                                </div>
                                <div class="invoice-body-info-item">
                                    <div class="info-item-td text-end text-bold">Percentage:</div>
                                    <div class="info-item-td text-start"><%=rs.getPer()%></div>
                                </div>
                            </div>
                            
                            </div>
                        </div>
                    </div>
                    <div class = "invoice-foot text-center">
                        <p><span class = "text-bold text-center">NOTE:&nbsp;</span>This is computer generated result and does not require physical signature.</p>

                        <div class = "invoice-btns">
                            <button type = "button" class = "invoice-btn" onclick="printInvoice()">
                                <span>
                                    <i class="fa-solid fa-print"></i>
                                </span>
                                <span>Print</span>
                            </button>
                            <button type = "button" class = "invoice-btn">
                                <span>
                                    <i class="fa-solid fa-download"></i>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>