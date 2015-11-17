<%@ Page Title="Home Page" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="http2demo._Default" %>


<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">

        function getTime() {
            var lapsed = browserSupport ? window.performance.now() : Date.now() - pgInit;
            document.getElementById("pgTimings").innerHTML = ((lapsed) / 1000).toFixed(2)
        }
        var pgInit = Date.now();
        var browserSupport = !(!('performance' in window) || !('timing' in window.performance) || !('navigation' in window.performance));

    </script>
    <%--<div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
    </div>--%>
    <div class="row">
        <br />
    </div>
      <div class="row">
        <div class="col-md-6">
         A grid of 240 tiled images is below. Compare:<p>
             [<a href="<%=HTTPSBaseURL%>default.aspx?latency=0">HTTP/2, 0 latency</a>] [<a href='<%=HTTPBaseURL%>default.aspx?protocol=h1'>HTTP/1, 0 latency</a>]<br>
[<a href='<%=HTTPSBaseURL%>default.aspx?protocol=h2&latency=30'>HTTP/2, 30ms latency</a>] [<a href='<%=HTTPBaseURL%>default.aspx?protocol=h1&latency=30'>HTTP/1, 30ms latency</a>]<br>
[<a href='<%=HTTPSBaseURL%>default.aspx?protocol=h2&latency=200'>HTTP/2, 200ms latency</a>] [<a href='<%=HTTPBaseURL%>default.aspx?protocol=h1&latency=200'>HTTP/1, 200ms latency</a>]<br>
[<a href='<%=HTTPSBaseURL%>default.aspx?protocol=h2&latency=1000'>HTTP/2, 1s latency</a>] [<a href='<%=HTTPBaseURL%>default.aspx?protocol=h1&latency=1000'>HTTP/1, 1s latency</a>]<br>   
            
        </div>
        <div class="col-md-6">
            <p>
            
            </p>
        </div>        
    </div>
    <div class="row">
        <div class="col-md-6">
            <div id="loads"><div>Latency: <b >0ms</b></div><div>Load time: <b ><span id="pgTimings"></span>s</b></div></div>
        </div>

    </div>
    <div class="row">
        
        <div class="col-md-12">
            
           <%-- <%foreach (var row in Images)
              {%>
                <%foreach (string col in row.Value)
                  {%>
                      <img width=133 height=125 src="images/Globe-<%=row.Key%>-<%=col%>">
                  <%} %>  
              <%} %>--%>

                <%for (int i = 0; i < 16; i++)
                  {%>
            <div style="display:block;margin:0;padding:0;border-collapse:collapse">
                    <%for (int j = 0; j < 15; j++)
                      {%>
                          <img width=67 height=63 src="images/Globe-<%=i%>-<%=j%>.png?<%=MyQueryString%>" style="margin:0;padding:0;border-collapse:collapse;float:left" onload="getTime()">
                      <%} %>  
                <div style="clear:both"></div>
                </div>
                  <%} %>
            
            
        </div>
        <div class="row">
            <div class="col-md-12">
                Demo concept inspired by  <a href="http://http2.golang.org/gophertiles">Golang's Gophertiles</a> and <a href="https://http2.akamai.com/demo">Akamai's HTTP/2 Demo</a>
            </div>

        </div>
       
    </div>
    <div>
        

    </div>
    </asp:Content>

