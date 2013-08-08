<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="FeedBackDetails.aspx.cs" Inherits="OPMS_Website.Admin.FeedBackDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeAdmin.aspx">HOME</a></li>
            <li><a href="BranchManagement.aspx">BRANCHES</a></li>
            <li><a href="AccountManagement.aspx">USERS</a></li>
            <li><a href="ServiceManagement.aspx">MANAGEMENT</a></li>
            <li class="current"><a href="NewsManagement.aspx">NEWS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%--Phan nay dung cho menu con--%>
    <div id="panel">
        <ul id="ulMenu" runat="server">
            <li><a href="NewsManagement.aspx" class="newAdd">News</a></li>
            <li><a href="FeedBackManagement.aspx" class="feedback">Feeb Back</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <%--Phan nay dung cho noi dung--%>
    <div id="box">
        <h3>Feed Back Details</h3> 
        <div class="form">
         <fieldset id="personal" class="form" style="text-align: left;">
            <legend class="legend" style="width: 116px">FEED BACK INFORMATION</legend>
             <br />
             &nbsp; &nbsp; &nbsp;&nbsp;
             <asp:Label ID="Label1" runat="server" Text="First Name:" Font-Bold="True" ForeColor="#330099"></asp:Label>
             <asp:Label ID="lblFullName" runat="server"></asp:Label><br />
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
             <br />
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             <asp:Label ID="Label3" runat="server" Text="Email:" Font-Bold="True" ForeColor="#330099"></asp:Label>
             <asp:Label ID="lblEmail" runat="server"></asp:Label><br />
             <br />
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             <asp:Label ID="Label2" runat="server" Text="Content:" Font-Bold="True" ForeColor="#330099"></asp:Label>
             
             &nbsp;<asp:Literal ID="ltrContent" runat="server"></asp:Literal>
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<br />
             <br />
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <asp:Button ID="btnClose"
                 runat="server" Text="Close" PostBackUrl="~/Admin/FeedBackManagement.aspx" /><br />
         </fieldset>
        </div>
    </div>
</asp:Content>
