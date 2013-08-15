<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Employee/masterPageEmployee.Master" AutoEventWireup="true" CodeBehind="OrderUpdate.aspx.cs" Inherits="OPMS_Website.Employee.OrderUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Phan nay dung cho menu--%>
    <div id="topmenu">
        <ul>
            <li><a href="HomeEmployee.aspx">HOME</a></li>
            <li class="current"><a href="OrderManagement.aspx">ORDERS</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="box">
        <h3>Update Order</h3>
        <div class="form" runat="server" id="Div1">
            <asp:Panel ID="_pnlMailCustomer" runat="server" Width="710px">
                <fieldset id="Fieldset1" class="form" style="text-align: left">
                    <legend class="legend" style="width: 85px">SENDER INFORMATION</legend>&nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Sender Name:"></asp:Label>
                    <asp:TextBox ID="txtSenderName" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server"
                        Text="Phone:"></asp:Label>
                    <asp:TextBox ID="txtSenderPhone" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" Text="Address:"></asp:Label>
                    <asp:TextBox ID="txtSenderAddress" runat="server" TextMode="MultiLine" Width="330px" Height="35px" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                </fieldset>
                <br />
                <fieldset id="Fieldset2" class="form" style="text-align: left">
                    <legend class="legend" style="width: 85px">RECEIVER INFORMATION</legend>&nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label9" runat="server" Text="Receiver Name:"></asp:Label>
                    <asp:TextBox ID="txtReceiverName" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label10" runat="server"
                    Text="Phone:"></asp:Label>
                    <asp:TextBox ID="txtReceiverPhone" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label11" runat="server" Text="Address:"></asp:Label>
                    <asp:TextBox ID="txtReceiverAddress" runat="server" TextMode="MultiLine" Width="330px" Height="35px" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                </fieldset>
                <fieldset id="Fieldset3" class="form" style="text-align: left; width: 680px;">
                    <legend class="legend" style="width: 85px">MAIL / &nbsp;DELIVERY / FEE </legend>
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label19" runat="server" Text="Service Type:"></asp:Label>
                    <asp:DropDownList ID="ddlService" runat="server" Width="180px" Enabled="False">
                    </asp:DropDownList><br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label20" runat="server" Text="Distance: "></asp:Label>
                    <asp:DropDownList ID="ddlDistance" runat="server" Width="180px" Enabled="False">
                    </asp:DropDownList><br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label21" runat="server" Text="Weight:"></asp:Label>&nbsp;<asp:DropDownList ID="ddlWeight" runat="server" Width="180px" Enabled="False">
                </asp:DropDownList>
                    &nbsp;<br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label22" runat="server" Text="Total: "></asp:Label>
                    &nbsp;<asp:TextBox ID="txtTotal" runat="server" Width="180px" ReadOnly="True" Enabled="False"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label24" runat="server" Text="Status: "></asp:Label>
                    <asp:DropDownList ID="ddlStatus" runat="server" Width="180px">
                        <asp:ListItem>Sending</asp:ListItem>
                        <asp:ListItem>Sent</asp:ListItem>
                        <asp:ListItem>Return</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label25" runat="server" Text="Date: "></asp:Label>
                    &nbsp;<asp:TextBox ID="txtDate" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Date is not empty !" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                    <asp:Label ID="Label8" runat="server" Text="[mm / dd / yyyy]"></asp:Label>
                    <asp:Label ID="lblCheckDate" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label23" runat="server" Text="Note: "></asp:Label>
                    &nbsp;<asp:TextBox ID="txtNote" runat="server" Height="35px" TextMode="MultiLine" Width="330px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs:" ShowMessageBox="false" ShowSummary="true" ForeColor="Red" />
                    <br />
                </fieldset>
            </asp:Panel>
            <br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="lblStatusEditOrder" runat="server" ForeColor="Red"></asp:Label>&nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; 
            <asp:Button ID="btnEdit" runat="server" Text="Apply change" Width="105px" OnClick="btnEdit_Click" />
            <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="False" PostBackUrl="~/Employee/OrderManagement.aspx" /><br />
        </div>
    </div>
</asp:Content>
