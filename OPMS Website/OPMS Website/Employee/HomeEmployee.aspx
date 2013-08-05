<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/masterPageEmployee.Master" AutoEventWireup="true" CodeBehind="HomeEmployee.aspx.cs" Inherits="OPMS_Website.Employee.HomeEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
    	<ul>
        	<li class="current"><a href="HomeEmployee.aspx">HOME</a></li>
            <li><a href="OrderManagement.aspx">ORDERS</a></li>        	                           
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="box">
        <h3>Wellcome</h3>
        <div id="Div1" class="form" runat="server">
            <fieldset id="personal" class="form" style="text-align: left">
            <legend class="legend" style="width: 85px">INFORMATION</legend>
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label1" runat="server" Text="Full Name :"></asp:Label>
                <asp:Label ID="lblFullName" runat="server"></asp:Label>
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Text="Belong to :"></asp:Label>
                <asp:Label ID="lblBranchName" runat="server" ForeColor="#0000C0"></asp:Label>
                <br />
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="Total Order:"></asp:Label>
                <asp:Label ID="lblTotalOrder" runat="server" ForeColor="Maroon"></asp:Label><br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Order sending :"></asp:Label>
                <asp:Label ID="lblOrderSending" runat="server" ForeColor="Olive"></asp:Label><br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Text="Order at Branch:"></asp:Label>
                <asp:Label ID="lblOrderAtBranch" runat="server" ForeColor="#FF8000"></asp:Label><br />
                <br />
              </fieldset>
        </div>
    </div>
</asp:Content>
